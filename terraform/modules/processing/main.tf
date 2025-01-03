module "lambda" {
  source = "./lambda"

  resource_prefix     = var.resource_prefix
  tags               = var.tags
  jobs_table_arn     = var.jobs_table_arn
  jobs_table_name    = var.jobs_table_name
  step_function_arn  = module.step_functions.state_machine_arn
  upload_bucket_arn  = var.upload_bucket_arn
  upload_bucket_name = var.upload_bucket_name
  media_output_bucket_arn = var.media_output_bucket_arn
  media_output_bucket_name = var.media_output_bucket_name
  mediaconvert_endpoint = var.mediaconvert_endpoint
  mediaconvert_role_arn = var.mediaconvert_role_arn
  mediaconvert_queue_arn = var.mediaconvert_queue_arn
}

module "step_functions" {
  source = "./step_functions"

  resource_prefix      = var.resource_prefix
  tags                = var.tags
  lambda_function_arns = module.lambda.function_arns

  depends_on = [module.lambda]
}

