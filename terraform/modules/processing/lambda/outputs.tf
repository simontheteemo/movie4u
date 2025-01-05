output "function_arns" {
  value = { for name, func in aws_lambda_function.functions : name => func.arn }
}

output "function_names" {
  value = { for name, func in aws_lambda_function.functions : name => func.function_name }
}

output "role_id" {
  value = aws_iam_role.lambda_role.id
}