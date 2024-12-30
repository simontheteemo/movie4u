output "upload_bucket_name" {
  description = "Name of the S3 bucket for video uploads"
  value       = module.storage.upload_bucket_name
}

output "analysis_table_name" {
  description = "Name of the DynamoDB table for analysis results"
  value       = module.storage.analysis_table_name
}

output "processor_function_name" {
  description = "Name of the Lambda processor function"
  value       = module.processing.processor_function_name
}