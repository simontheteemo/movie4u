variable "resource_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
}

variable "lambda_function_arns" {
  description = "Map of Lambda function ARNs"
  type        = map(string)
} 