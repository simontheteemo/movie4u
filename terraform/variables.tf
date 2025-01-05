variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "environment" {
  description = "Environment name (dev/prod)"
  type        = string
  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Environment must be either 'dev' or 'prod'."
  }
}

variable "mediaconvert_endpoint" {
  description = "AWS MediaConvert endpoint"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "movie4u"
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

output "processor_function_name" {
  value       = module.video_processing.processing.function_names["processor"]
  description = "Name of the processor Lambda function"
}

output "step_function_arn" {
  value       = module.video_processing.processing.step_function_arn
  description = "ARN of the Step Function state machine"
}