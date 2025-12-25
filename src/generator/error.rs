use crate::context::Context;
use std::fs;
use std::io::Write;
use std::path::Path;

pub fn generate_error_module(_ctx: &Context, _name: &str) {
    let template = include_str!("../../templates/error.rs.tpl");
    
    // Create src directory if it doesn't exist
    let src_dir = Path::new("src");
    if !src_dir.exists() {
        fs::create_dir_all(src_dir).expect("Failed to create src directory");
    }
    
    let file_path = src_dir.join("error.rs");
    
    // Check if file already exists
    if file_path.exists() {
        println!("⏭️  Error module already exists: src/error.rs");
        return;
    }
    
    // Write the error module
    let mut file = fs::File::create(&file_path).expect("Failed to create error.rs");
    file.write_all(template.as_bytes())
        .expect("Failed to write error.rs");
    
    println!("✅ Generated error module: src/error.rs");
    
    // Update lib.rs to include error module
    update_lib_rs();
}

fn update_lib_rs() {
    let lib_path = Path::new("src/lib.rs");
    
    if !lib_path.exists() {
        println!("⚠️  Warning: src/lib.rs not found, skipping update");
        return;
    }
    
    let content = fs::read_to_string(lib_path).expect("Failed to read lib.rs");
    
    // Check if error module is already declared
    if content.contains("pub mod error;") {
        return;
    }
    
    // Add error module declaration at the beginning
    let new_content = format!("pub mod error;\n{}", content);
    
    fs::write(lib_path, new_content).expect("Failed to update lib.rs");
    println!("✅ Updated src/lib.rs with error module");
}
