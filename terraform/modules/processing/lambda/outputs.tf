output "function_arns" {
  description = "Map of Lambda function ARNs"
  value = {
    for name, function in aws_lambda_function.functions : name => function.arn
  }
}

output "function_names" {
  description = "Map of Lambda function names"
  value = {
    for name, function in aws_lambda_function.functions : name => function.function_name
  }
}

output "role_id" {
  description = "ID of the Lambda role"
  value       = aws_iam_role.lambda_role.id
}