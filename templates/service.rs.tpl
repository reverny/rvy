use std::sync::Arc;
use crate::usecase::{{name}}_usecase::{{Name}}Usecase;
use crate::data::{{name}}_data::{{Name}}Data;
use crate::error::{AppError, Result};

pub struct {{Name}}Service {
    usecase: Arc<{{Name}}Usecase>,
}

impl {{Name}}Service {
    pub fn new(usecase: Arc<{{Name}}Usecase>) -> Self {
        Self { usecase }
    }

    pub async fn get_by_id(&self, id: i64) -> Result<{{Name}}Data> {
        self.usecase.get_by_id(id).await
    }

    pub async fn get_all(&self) -> Result<Vec<{{Name}}Data>> {
        self.usecase.get_all().await
    }

    pub async fn create(&self, data: {{Name}}Data) -> Result<{{Name}}Data> {
        self.usecase.create(data).await
    }

    pub async fn update(&self, id: i64, data: {{Name}}Data) -> Result<{{Name}}Data> {
        self.usecase.update(id, data).await
    }

    pub async fn delete(&self, id: i64) -> Result<()> {
        self.usecase.delete(id).await
    }
}
