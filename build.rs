#[macro_use]
extern crate serde_derive;
extern crate toml;


use std::collections::HashMap;
use std::fs::File;
use std::io::Read;
use std::process::Command;
use std::path::{Path, PathBuf};


#[derive(Deserialize, Serialize)]
struct ElmConfig {
    targets: HashMap<PathBuf, PathBuf>,
}


fn main() {
    // Tell Cargo to run only if Elm source is changed.
    println!("cargo:rerun-if-changed=elm/");

    let mut elm_str = String::new();

    File::open("Elm.toml")
        .and_then(|mut elm_file| elm_file.read_to_string(&mut elm_str))
        .expect("Unable to read Elm build configuration.");

    let elm_cfg: ElmConfig = toml::from_str(&elm_str).expect("Elm.toml contains invalid TOML!");

    let results: Vec<_> = elm_cfg
        .targets
        .iter()
        .map(|(rel_input_path, rel_output_path)| {
            Command::new("elm-make")
                .arg(Path::new("elm").join(rel_input_path))
                .arg("--output")
                .arg(Path::new("web").join(rel_output_path))
                .arg("--yes")
                .output()
        })
        .collect();

    let mut failed = false;

    for result in results {
        let out = result.unwrap();

        if !out.status.success() {
            println!("{}", String::from_utf8_lossy(&out.stderr));

            failed = true;
        }
    }

    if failed {
        std::process::exit(1);
    }
}
