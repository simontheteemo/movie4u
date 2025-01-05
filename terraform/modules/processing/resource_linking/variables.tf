variable "step_function_arn" {
  type        = string
  description = "ARN of the Step Function state machine"
}

variable "lambda_function_arns" {
  type        = map(string)
  description = "Map of Lambda function ARNs"
}

variable "lambda_role_id" {
  type        = string
  description = "ID of the Lambda execution role"
} 