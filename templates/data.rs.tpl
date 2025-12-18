use serde::{Deserialize, Serialize};
use sqlx::FromRow;
use utoipa::ToSchema;

#[derive(Debug, Clone, Serialize, Deserialize, FromRow, ToSchema)]
pub struct {{Name}}Data {
    #[schema(example = 1)]
    pub id: i64,
    #[schema(example = "Example {{Name}}")]
    pub name: String,
    pub created_at: Option<chrono::DateTime<chrono::Utc>>,
    pub updated_at: Option<chrono::DateTime<chrono::Utc>>,
    // Add your additional fields here
}

impl {{Name}}Data {
    pub fn new(id: i64, name: String) -> Self {
        Self {
            id,
            name,
            created_at: Some(chrono::Utc::now()),
            updated_at: Some(chrono::Utc::now()),
        }
    }
}
