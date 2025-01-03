output "state_machine_arn" {
  description = "ARN of the Step Functions state machine"
  value       = module.step_functions.state_machine_arn
}

output "lambda_function_arns" {
  description = "Map of Lambda function ARNs"
  value       = module.lambda.function_arns
}

output "lambda_function_names" {
  description = "Map of Lambda function names"
  value       = module.lambda.function_names
}