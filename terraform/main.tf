provider "aws" {
  region = var.aws_region
}

# First create storage resources
module "storage" {
  source = "./modules/storage"

  resource_prefix = local.resource_prefix
  tags            = local.tags
}

# Then create processing resources
module "processing" {
  source = "./modules/processing"

  resource_prefix        = local.resource_prefix
  tags                   = local.tags
  upload_bucket_arn      = module.storage.upload_bucket_arn
  upload_bucket_name     = module.storage.upload_bucket_name
  analysis_table_arn     = module.storage.analysis_table_arn
  analysis_table_name    = module.storage.analysis_table_name
  mediaconvert_endpoint  = module.storage.mediaconvert_endpoint
  mediaconvert_queue_arn = module.storage.mediaconvert_queue_arn
}

# Finally, set up the S3 notification
resource "aws_s3_bucket_notification" "upload_notification" {
  bucket = module.storage.upload_bucket_name

  lambda_function {
    lambda_function_arn = module.processing.processor_function_arn
    events              = ["s3:ObjectCreated:*"]
    filter_suffix       = ".mp4"
  }

  depends_on = [
    module.storage,
    module.processing
  ]
}

terraform {
  backend "s3" {
    bucket = "movie2u"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}
