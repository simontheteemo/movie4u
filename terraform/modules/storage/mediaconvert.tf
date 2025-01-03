# S3 bucket for MediaConvert output
resource "aws_s3_bucket" "media_output" {
  bucket = "${var.resource_prefix}-media-output"
  tags   = var.tags
}

# IAM role for MediaConvert
resource "aws_iam_role" "mediaconvert" {
  name = "${var.resource_prefix}-mediaconvert-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "mediaconvert.amazonaws.com"
        }
      }
    ]
  })
}

# IAM policy for MediaConvert
resource "aws_iam_role_policy" "mediaconvert" {
  name = "${var.resource_prefix}-mediaconvert-policy"
  role = aws_iam_role.mediaconvert.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]
        Resource = [
          "${aws_s3_bucket.upload.arn}/*",
          "${aws_s3_bucket.media_output.arn}/*"
        ]
      }
    ]
  })
}

resource "aws_media_convert_queue" "main" {
  name = "${var.resource_prefix}-queue"
  tags = var.tags
}

# Add S3 bucket policy for Transcribe access
resource "aws_s3_bucket_policy" "media_output_policy" {
  bucket = aws_s3_bucket.media_output.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowTranscribeRead"
        Effect = "Allow"
        Principal = {
          Service = "transcribe.amazonaws.com"
        }
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          aws_s3_bucket.media_output.arn,
          "${aws_s3_bucket.media_output.arn}/*"
        ]
      }
    ]
  })
}

resource "aws_s3_bucket_versioning" "media_output" {
  bucket = aws_s3_bucket.media_output.id
  versioning_configuration {
    status = "Enabled"
  }
}