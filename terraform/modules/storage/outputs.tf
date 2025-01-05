output "jobs_table_arn" {
  description = "ARN of the jobs DynamoDB table"
  value       = aws_dynamodb_table.jobs.arn
}

output "jobs_table_name" {
  description = "Name of the jobs DynamoDB table"
  value       = aws_dynamodb_table.jobs.name
}

output "upload_bucket_arn" {
  value = aws_s3_bucket.upload.arn
}

output "upload_bucket_name" {
  value = aws_s3_bucket.upload.id
}

output "analysis_table_arn" {
  value = aws_dynamodb_table.jobs.arn
}

output "analysis_table_name" {
  value = aws_dynamodb_table.jobs.arn
}

output "media_output_bucket_arn" {
  value = aws_s3_bucket.media_output.arn
}

output "media_output_bucket_name" {
  value = aws_s3_bucket.media_output.id
}

output "mediaconvert_role_arn" {
  value = aws_iam_role.mediaconvert.arn
}

output "mediaconvert_endpoint" {
  value = var.mediaconvert_endpoint
}

output "mediaconvert_queue_arn" {
  value = aws_media_convert_queue.main.arn
}

output "media_bucket_name" {
  value = aws_s3_bucket.media.id
  description = "Name of the S3 bucket for media storage"
}