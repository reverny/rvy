use crate::context::Context;
use crate::generator::{render, write_file, update_module_exports};
use std::path::Path;

pub fn generate(ctx: &Context, name: &str) {
    let template = include_str!("../../templates/data.rs.tpl");

    let content = render(template, name);

    let path = format!("src/data/{}_data.rs", name);
    let handler_path = format!("src/handler/{}_handler.rs", name);

    write_file(ctx, &path, &content);
    update_module_exports(ctx, "src/data/mod.rs", &format!("{}_data", name));
    
    // Check if handler exists and suggest regenerating swagger
    if !ctx.dry_run && Path::new(&handler_path).exists() {
        println!("💡 Tip: Data model updated. Regenerate Swagger docs with:");
        println!("   rvy gen swagger {}", name);
        println!("   or use --force to regenerate handler:");
        println!("   rvy gen handler {} --force", name);
    }
}
