use async_trait::async_trait;
use crate::data::{{name}}_data::{{Name}}Data;
use crate::error::Result;

#[async_trait]
pub trait {{Name}}Repository: Send + Sync {
    async fn find_by_id(&self, id: i64) -> Result<{{Name}}Data>;
    
    async fn find_all(&self) -> Result<Vec<{{Name}}Data>>;
    
    async fn save(&self, data: &{{Name}}Data) -> Result<{{Name}}Data>;
    
    async fn update(&self, id: i64, data: &{{Name}}Data) -> Result<{{Name}}Data>;
    
    async fn delete(&self, id: i64) -> Result<()>;
}
