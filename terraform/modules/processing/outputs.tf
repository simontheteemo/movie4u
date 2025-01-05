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

output "function_names" {
  value = module.lambda.function_names
}

output "function_arns" {
  value = module.lambda.function_arns
}

output "step_function_arn" {
  value = module.step_functions.state_machine_arn
}

output "processor_function_name" {
  value = module.lambda.function_names["processor"]
} 