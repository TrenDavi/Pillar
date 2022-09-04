#![allow(dead_code)]

use glob::{glob_with, MatchOptions};
use object::Object;
use std::error::Error;
use std::fs;

#[test]
fn test_fn() {
    // Test processor functionality
}

fn main() -> Result<(), Box<dyn Error>> {
    let options = MatchOptions {
        case_sensitive: false,
        ..Default::default()
    };

    for file in glob_with("../tests/*.o", options).unwrap() {
        let file_path = file.as_ref().unwrap();
        let bin_data = fs::read(file_path)?;
        let obj_file = object::File::parse(&*bin_data)?;
        let section = obj_file.entry();

        println!("{:?} starts at:{:#x?}", file.unwrap().display(), section);
    }
    Ok(())
}
