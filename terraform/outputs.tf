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

output "media_bucket" {
  value       = module.storage.media_bucket_name
  description = "Name of the S3 bucket for media storage"
}

output "media_output_bucket" {
  value       = module.storage.media_output_bucket_name
  description = "Name of the S3 bucket for processed media output"
}

output "jobs_table" {
  value       = module.storage.jobs_table_name
  description = "Name of the DynamoDB table for jobs"
}

output "step_function_arn" {
  value       = module.processing.step_function_arn
  description = "ARN of the Step Function state machine"
}