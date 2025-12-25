use std::sync::Arc;
use crate::repository::{{name}}::{{Name}}Repository;
use crate::data::{{name}}_data::{{Name}}Data;
use crate::error::{AppError, Result};

pub struct {{Name}}Usecase {
    repository: Arc<dyn {{Name}}Repository>,
}

impl {{Name}}Usecase {
    pub fn new(repository: Arc<dyn {{Name}}Repository>) -> Self {
        Self { repository }
    }

    pub async fn get_by_id(&self, id: i64) -> Result<{{Name}}Data> {
        self.repository.find_by_id(id).await
    }

    pub async fn get_all(&self) -> Result<Vec<{{Name}}Data>> {
        self.repository.find_all().await
    }

    pub async fn create(&self, data: {{Name}}Data) -> Result<{{Name}}Data> {
        // Add business logic validation here if needed
        if data.name.is_empty() {
            return Err(AppError::Validation("Name cannot be empty".to_string()));
        }
        self.repository.save(&data).await
    }

    pub async fn update(&self, id: i64, data: {{Name}}Data) -> Result<{{Name}}Data> {
        // Add business logic validation here if needed
        if data.name.is_empty() {
            return Err(AppError::Validation("Name cannot be empty".to_string()));
        }
        self.repository.update(id, &data).await
    }

    pub async fn delete(&self, id: i64) -> Result<()> {
        // Add business logic validation here if needed
        self.repository.delete(id).await
    }
}
