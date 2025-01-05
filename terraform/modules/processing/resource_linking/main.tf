variable "step_function_arn" {
  type = string
}

variable "lambda_function_arns" {
  type = map(string)
}

# Add permissions for Step Functions to invoke Lambda
resource "aws_lambda_permission" "step_functions" {
  for_each = var.lambda_function_arns

  statement_id  = "AllowStepFunctionsInvoke"
  action        = "lambda:InvokeFunction"
  function_name = each.value
  principal     = "states.amazonaws.com"
  source_arn    = var.step_function_arn
}

# Add more specific IAM permissions for Lambda to invoke Step Functions
resource "aws_iam_role_policy" "lambda_step_functions" {
  name = "lambda-step-functions"
  role = var.lambda_role_id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = ["states:StartExecution"]
        Resource = [var.step_function_arn]
      }
    ]
  })
} 