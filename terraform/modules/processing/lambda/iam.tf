resource "aws_iam_role" "lambda_role" {
  name = "${var.resource_prefix}-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy" "lambda_policy" {
  name = "${var.resource_prefix}-lambda-policy"
  role = aws_iam_role.lambda_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = concat([
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = ["arn:aws:logs:*:*:*"]
      },
      {
        Effect = "Allow"
        Action = [
          "dynamodb:PutItem",
          "dynamodb:GetItem",
          "dynamodb:UpdateItem"
        ]
        Resource = [var.jobs_table_arn]
      },
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = [
          "${var.upload_bucket_arn}/*",
          "${var.media_output_bucket_arn}/*",
          var.upload_bucket_arn,
          var.media_output_bucket_arn
        ]
      },
      {
        Effect = "Allow"
        Action = [
          "states:StartExecution"
        ]
        Resource = [var.step_function_arn]
      },
      {
        Effect = "Allow"
        Action = [
          "rekognition:StartLabelDetection",
          "rekognition:GetLabelDetection"
        ]
        Resource = ["*"]
      },
      {
        Effect = "Allow"
        Action = [
          "transcribe:StartTranscriptionJob",
          "transcribe:GetTranscriptionJob"
        ]
        Resource = ["*"]
      },
      {
        Effect = "Allow"
        Action = [
          "mediaconvert:CreateJob",
          "mediaconvert:GetJob"
        ]
        Resource = ["*"]
      },
      {
        Effect = "Allow"
        Action = [
          "polly:StartSpeechSynthesisTask",
          "polly:GetSpeechSynthesisTask"
        ]
        Resource = ["*"]
      },
      {
        Effect = "Allow"
        Action = [
          "bedrock:InvokeModel"
        ]
        Resource = ["*"]
      }
    ], var.step_function_arn != null ? [
      {
        Effect = "Allow"
        Action = [
          "states:StartExecution"
        ]
        Resource = [var.step_function_arn]
      }
    ] : [])
  })
}
