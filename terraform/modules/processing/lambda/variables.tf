variable "resource_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
}

variable "jobs_table_arn" {
  description = "ARN of the jobs DynamoDB table"
  type        = string
}

variable "jobs_table_name" {
  description = "Name of the jobs DynamoDB table"
  type        = string
}

variable "step_function_arn" {
  description = "ARN of the Step Function state machine"
  type        = string
  default     = ""  # Empty string instead of null
}

variable "upload_bucket_arn" {
  description = "ARN of the upload S3 bucket"
  type        = string
}

variable "media_output_bucket_arn" {
  description = "ARN of the media output S3 bucket"
  type        = string
}

variable "upload_bucket_name" {
  description = "Name of the upload S3 bucket"
  type        = string
}

variable "media_output_bucket_name" {
  description = "Name of the media output S3 bucket"
  type        = string
}

variable "mediaconvert_endpoint" {
  description = "MediaConvert endpoint URL"
  type        = string
}

variable "mediaconvert_role_arn" {
  description = "MediaConvert IAM role ARN"
  type        = string
}

variable "mediaconvert_queue_arn" {
  description = "MediaConvert queue ARN"
  type        = string
}
