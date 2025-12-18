use std::sync::Arc;
use crate::config::database::{DatabaseConfig, DatabaseType};
use crate::repository::{{name}}::{{Name}}Repository;

// Import all adapters
use crate::adapter::{{name}}_postgres::Postgres{{Name}}Repository;
use crate::adapter::{{name}}_mysql::Mysql{{Name}}Repository;
use crate::adapter::{{name}}_mongodb::Mongo{{Name}}Repository;
use crate::adapter::{{name}}_sqlite::Sqlite{{Name}}Repository;

/// Factory function to create {{Name}}Repository based on config
pub async fn create_{{name}}_repository(
    config: &DatabaseConfig,
) -> Result<Arc<dyn {{Name}}Repository>, Box<dyn std::error::Error>> {
    match config.db_type {
        DatabaseType::Postgres => {
            let pool = sqlx::PgPool::connect(&config.url).await?;
            Ok(Arc::new(Postgres{{Name}}Repository::new(pool)))
        }

        DatabaseType::Mysql => {
            let pool = sqlx::MySqlPool::connect(&config.url).await?;
            Ok(Arc::new(Mysql{{Name}}Repository::new(pool)))
        }

        DatabaseType::Mongodb => {
            let client = mongodb::Client::with_uri_str(&config.url).await?;
            let db = client.database("mydb"); // Change database name as needed
            let collection = db.collection("{{name}}s");
            Ok(Arc::new(Mongo{{Name}}Repository::new(collection)))
        }

        DatabaseType::Sqlite => {
            let pool = sqlx::SqlitePool::connect(&config.url).await?;
            Ok(Arc::new(Sqlite{{Name}}Repository::new(pool)))
        }
    }
}
