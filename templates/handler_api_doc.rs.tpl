use utoipa::OpenApi;
use crate::data::{{name}}_data::{{Name}}Data;

/// OpenAPI documentation for {{Name}} endpoints
#[derive(OpenApi)]
#[openapi(
    paths(
        crate::handler::{{name}}_handler::get_all_{{name}}s,
        crate::handler::{{name}}_handler::get_{{name}}_by_id,
        crate::handler::{{name}}_handler::create_{{name}},
        crate::handler::{{name}}_handler::update_{{name}},
        crate::handler::{{name}}_handler::delete_{{name}}
    ),
    components(schemas({{Name}}Data)),
    tags(
        (name = "{{name}}", description = "{{Name}} management endpoints")
    )
)]
pub struct {{Name}}ApiDoc;
