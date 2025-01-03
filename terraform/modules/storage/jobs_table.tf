resource "aws_dynamodb_table" "jobs" {
  name           = "${var.resource_prefix}-jobs"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "jobId"
  range_key      = "timestamp"

  attribute {
    name = "jobId"
    type = "S"
  }

  attribute {
    name = "timestamp"
    type = "S"
  }

  tags = var.tags
}
