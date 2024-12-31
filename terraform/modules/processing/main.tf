# IAM role for Lambda
resource "aws_iam_role" "processor" {
  name = "${var.resource_prefix}-processor-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

  tags = var.tags
}

# IAM policy for Lambda
resource "aws_iam_role_policy" "processor" {
  name = "${var.resource_prefix}-processor-policy"
  role = aws_iam_role.processor.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = [
          var.upload_bucket_arn,
          "${var.upload_bucket_arn}/*"
        ]
      },
      {
        Effect = "Allow"
        Action = [
          "rekognition:StartLabelDetection",
          "rekognition:GetLabelDetection"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "dynamodb:PutItem",
          "dynamodb:GetItem",
          "dynamodb:UpdateItem"
        ]
        Resource = [
          var.analysis_table_arn
        ]
      },
      {
        Effect = "Allow"
        Action = [
          "bedrock:InvokeModel"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "mediaconvert:CreateJob",
          "mediaconvert:GetJob",
          "mediaconvert:ListJobs"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "s3:PutObject"
        ]
        Resource = "${var.media_output_bucket_arn}/*"
      }
    ]
  })
}

# CloudWatch Logs policy
resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.processor.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Lambda function
resource "aws_lambda_function" "processor" {
  filename      = "${path.module}/processor.zip"
  function_name = "${var.resource_prefix}-processor"
  role          = aws_iam_role.processor.arn
  handler       = "index.handler"
  runtime       = "nodejs18.x"
  timeout       = 900
  memory_size   = 256

  source_code_hash = filebase64sha256("${path.module}/processor.zip")

  environment {
    variables = {
      UPLOAD_BUCKET         = var.upload_bucket_name
      ANALYSIS_TABLE        = var.analysis_table_name
      MEDIACONVERT_ENDPOINT = var.mediaconvert_endpoint
      MEDIACONVERT_QUEUE    = var.mediaconvert_queue_arn
    }
  }

  tags = var.tags
}

# Allow S3 to invoke Lambda
resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.processor.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = var.upload_bucket_arn
}
