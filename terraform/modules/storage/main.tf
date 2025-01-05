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