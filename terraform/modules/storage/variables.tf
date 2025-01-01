variable "resource_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
}

variable "mediaconvert_endpoint" {
  description = "AWS MediaConvert endpoint URL"
  type        = string
}