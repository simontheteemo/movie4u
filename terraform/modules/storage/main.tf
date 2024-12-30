# S3 bucket for video uploads
resource "aws_s3_bucket" "upload" {
  bucket = "${var.resource_prefix}-uploads"
  tags   = var.tags
}

# S3 bucket versioning
resource "aws_s3_bucket_versioning" "upload" {
  bucket = aws_s3_bucket.upload.id
  versioning_configuration {
    status = "Enabled"
  }
}

# DynamoDB table for video analysis results
resource "aws_dynamodb_table" "analysis" {
  name         = "${var.resource_prefix}-analysis"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "videoId"
  range_key    = "timestamp"

  attribute {
    name = "videoId"
    type = "S"
  }

  attribute {
    name = "timestamp"
    type = "S"
  }

  tags = var.tags
}