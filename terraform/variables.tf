variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "mediaconvert_endpoint" {
  description = "AWS MediaConvert endpoint - get from AWS Console or CLI"
  type        = string
  # You can get this from: aws mediaconvert describe-endpoints --region your-region
  default     = "https://hvtjrir1c.mediaconvert.us-west-2.amazonaws.com"
}