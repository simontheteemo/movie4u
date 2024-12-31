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

# Get MediaConvert endpoint
data "aws_mediaconvert_endpoint" "current" {
  endpoint_type = "AWS_MANAGED"
}
