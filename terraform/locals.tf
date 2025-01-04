locals {
  project_name = "movie4u"
  environment  = var.environment # Keep this as variable for flexibility

  # Common tags
  tags = {
    Project     = local.project_name
    Environment = local.environment
    ManagedBy   = "terraform"
  }

  # Common naming convention
  resource_prefix = "${local.project_name}-${local.environment}"
}