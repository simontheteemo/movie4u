data "aws_region" "current" {}

locals {
  lambda_functions = {
    initializer = {
      name    = "initializer"
      handler = "index.handler"
      timeout = 30
    }
    video_analyzer = {
      name    = "videoAnalyzer"
      handler = "index.handler"
      timeout = 300
    }
    label_checker = {
      name    = "labelChecker"
      handler = "index.handler"
      timeout = 60
    }
    audio_processor = {
      name    = "audioProcessor"
      handler = "index.handler"
      timeout = 300
    }
    transcription_checker = {
      name    = "transcriptionChecker"
      handler = "index.handler"
      timeout = 60
    }
    narrative_generator = {
      name    = "narrativeGenerator"
      handler = "index.handler"
      timeout = 300
    }
    result_combiner = {
      name    = "resultCombiner"
      handler = "index.handler"
      timeout = 60
    }
    result_saver = {
      name    = "resultSaver"
      handler = "index.handler"
      timeout = 60
    }
    failure_handler = {
      name    = "failureHandler"
      handler = "index.handler"
      timeout = 60
    }
  }
}

resource "aws_lambda_function" "functions" {
  for_each = local.lambda_functions

  filename         = "${path.module}/dist/${each.value.name}.zip"
  function_name    = "${var.resource_prefix}-${each.value.name}"
  role            = aws_iam_role.lambda_role.arn
  handler         = each.value.handler
  runtime         = "nodejs18.x"
  timeout         = each.value.timeout
  memory_size     = 256

  environment {
    variables = {
      STATE_MACHINE_ARN = var.step_function_arn
      JOBS_TABLE        = var.jobs_table_name
      UPLOAD_BUCKET     = var.upload_bucket_name
      OUTPUT_BUCKET     = var.media_output_bucket_name
      MEDIACONVERT_ENDPOINT = var.mediaconvert_endpoint
      MEDIACONVERT_ROLE     = var.mediaconvert_role_arn
      MEDIACONVERT_QUEUE    = var.mediaconvert_queue_arn
      AWS_REGION = data.aws_region.current.name
    }
  }

  tags = var.tags
}
