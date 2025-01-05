provider "aws" {
  region = var.aws_region
}

# First create storage resources
module "storage" {
  source = "./modules/storage"

  resource_prefix = local.resource_prefix
  tags            = local.tags
  mediaconvert_endpoint = var.mediaconvert_endpoint
}

# Then create processing resources
module "processing" {
  source = "./modules/processing"

  resource_prefix        = local.resource_prefix
  tags                  = local.tags
  jobs_table_arn        = module.storage.jobs_table_arn
  jobs_table_name       = module.storage.jobs_table_name
  upload_bucket_arn     = module.storage.upload_bucket_arn
  upload_bucket_name    = module.storage.upload_bucket_name
  media_output_bucket_arn = module.storage.media_output_bucket_arn
  media_output_bucket_name = module.storage.media_output_bucket_name
  mediaconvert_endpoint = var.mediaconvert_endpoint
  mediaconvert_queue_arn = module.storage.mediaconvert_queue_arn
  mediaconvert_role_arn = module.storage.mediaconvert_role_arn
}

# Finally, set up the S3 notification
resource "aws_s3_bucket_notification" "upload_notification" {
  bucket = module.storage.upload_bucket_name

  lambda_function {
    lambda_function_arn = module.processing.lambda_function_arns["initializer"]
    events              = ["s3:ObjectCreated:*"]
    filter_suffix       = ".mp4"
  }

  depends_on = [
    module.storage,
    module.processing
  ]
}
