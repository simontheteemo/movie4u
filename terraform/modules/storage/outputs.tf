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

output "mediaconvert_endpoint" {
  value = data.aws_mediaconvert_endpoint.current.endpoint
}