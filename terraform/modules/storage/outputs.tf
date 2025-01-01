output "upload_bucket_arn" {
  value = aws_s3_bucket.upload.arn
}

output "upload_bucket_name" {
  value = aws_s3_bucket.upload.id
}

output "analysis_table_arn" {
  value = aws_dynamodb_table.analysis.arn
}

output "analysis_table_name" {
  value = aws_dynamodb_table.analysis.name
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