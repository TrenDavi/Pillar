#![allow(dead_code)]

use glob::{glob_with, MatchOptions};
use hex::encode;
use object::Object;
use std::error::Error;
use std::fs;
use std::fs::File;
use std::io::BufReader;
use std::io::Read;
use std::io::Write;
use subprocess::Popen;
use subprocess::PopenConfig;
use subprocess::Redirection;

fn run() -> Result<(), Box<dyn Error>> {
    let mut p = Popen::create(
        &[
            "vvp", "Pillar",
        ],
        PopenConfig {
            stdout: Redirection::Pipe,
            ..Default::default()
        },
    )?;

    let (_out, _err) = p.communicate(None)?;

    if let Some(_exit_status) = p.poll() {
    } else {
        p.terminate()?;
    }

    Ok(())
}

// Read the elf file, convert to hex characters,
// and insert the reset vector
fn hex() -> Result<(), Box<dyn Error>> {
    let mut p = Popen::create(
        &[
            "./elf2hex",
            "--bit-width",
            "8",
            "--input",
            "../tests/test.o",
            "--output",
            "../tests/tmp.hex",
        ],
        PopenConfig {
            stdout: Redirection::Pipe,
            ..Default::default()
        },
    )?;

    let (_out, _err) = p.communicate(None)?;

    if let Some(_exit_status) = p.poll() {
    } else {
        p.terminate()?;
    }

    let fileb = File::open("../tests/tmp.hex")?;
    let mut buf_reader = BufReader::new(fileb);
    let mut contents = String::new();
    buf_reader.read_to_string(&mut contents)?;

    let mut mainf = File::create("../tests/test.hex")?;

    let bin_data = fs::read("../tests/test.o")?;
    let obj_file = object::File::parse(&*bin_data)?;

    let mut section: u32 = obj_file.entry().try_into().unwrap();
    section += 4;

    let b4: u8 = ((section >> 24) & 0xff) as u8;
    let b3: u8 = ((section >> 16) & 0xff) as u8;
    let b2: u8 = ((section >> 8) & 0xff) as u8;
    let b1: u8 = (section & 0xff) as u8;

    writeln!(
        mainf,
        "{}\n{}\n{}\n{}",
        encode(vec!(b1)),
        encode(vec!(b2)),
        encode(vec!(b3)),
        encode(vec!(b4))
    )
    .expect("Failed to write reset vector to tmp.hex");

    write!(mainf, "{}", contents).expect("Failed to write .text");

    fs::remove_file("../tests/tmp.hex").expect("Failed to remove tmp.hex");

    Ok(())
}

// Compile the given file with set toolchain
fn compile(file_path: &str) -> Result<(), Box<dyn Error>> {
    let mut p = Popen::create(
        &[
            "riscv32-unknown-elf-gcc",
            "-Wall",
            "-Werror",
            "-o",
            "../tests/test.o",
            "-nostdlib",
            "-t",
            "../tests/link.lds",
            file_path,
        ],
        PopenConfig {
            stdout: Redirection::Pipe,
            ..Default::default()
        },
    )?;

    let (_out, _err) = p.communicate(None)?;

    if let Some(_exit_status) = p.poll() {
    } else {
        p.terminate()?;
    }

    Ok(())
}

fn main() {
    let options = MatchOptions {
        case_sensitive: false,
        ..Default::default()
    };
   
    for file in glob_with("../tests/*.c", options).unwrap() {
       let file_path = file.as_ref().unwrap();
       println!("Compiling {:?}", file_path);
       compile(file_path.to_str().unwrap()).expect("Failed to Compile");
       println!("Hexing    {:?}", file_path);
       hex().expect("Failed to Hex");
       println!("Running   {:?}", file_path);
       run().expect("Failed to Run");
    }
}
