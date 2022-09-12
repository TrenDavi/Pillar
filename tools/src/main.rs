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

#[test]
fn test_fn() -> Result<(), Box<dyn Error>> {
    // Test processor functionality
    let options = MatchOptions {
        case_sensitive: false,
        ..Default::default()
    };

    // Compile
    for file in glob_with("../tests/*.c", options).unwrap() {
        let file_path = file.as_ref().unwrap();

        let mut p = Popen::create(
            &[
                "riscv32-unknown-elf-gcc",
                "-o",
                "../tests/test.o",
                "-nostdlib",
                "-t",
                "../tests/link.ld",
                file_path.to_str().unwrap(),
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

        println!("Building: {:?}", file_path);
    }

    // Convert
    for file in glob_with("../tests/*.o", options).unwrap() {
        let file_path = file.as_ref().unwrap();
        let bin_data = fs::read(file_path)?;
        let obj_file = object::File::parse(&*bin_data)?;
        let mut section: u32 = obj_file.entry().try_into().unwrap();
        section += 4;

        let b4: u8 = ((section >> 24) & 0xff) as u8;
        let b3: u8 = ((section >> 16) & 0xff) as u8;
        let b2: u8 = ((section >> 8) & 0xff) as u8;
        let b1: u8 = (section & 0xff) as u8;

        let mut p = Popen::create(
            &[
                "./elf2hex",
                "--bit-width",
                "8",
                "--input",
                file_path.to_str().unwrap(),
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

        writeln!(
            mainf,
            "{}\n{}\n{}\n{}",
            encode(vec!(b1)),
            encode(vec!(b2)),
            encode(vec!(b3)),
            encode(vec!(b4))
        ).expect("Copy of reset vector failed");

        write!(mainf, "{}",  contents).expect("Copy of rom data failed");
    }

    fs::remove_file("../tests/tmp.hex").expect("File delete failed");

    Ok(())
}

fn main(){}
