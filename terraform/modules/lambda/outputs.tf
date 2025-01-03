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