pub use self::cargo_clean::clean;
pub use self::cargo_compile::{compile, CompileOptions};
pub use self::cargo_read_manifest::{read_manifest,read_package,read_packages};
pub use self::cargo_rustc::compile_targets;
pub use self::cargo_run::run;
pub use self::cargo_new::{new, NewOptions};
pub use self::cargo_doc::{doc, DocOptions};

mod cargo_clean;
mod cargo_compile;
mod cargo_read_manifest;
mod cargo_rustc;
mod cargo_run;
mod cargo_new;
mod cargo_doc;
