locals {
  # Create a map of placeholder values for Lambda ARNs
  placeholder_arns = {
    for name in ["transcriptionTrigger", "transcriptionChecker", "resultSaver"] :
    name => "arn:aws:lambda:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:function:${var.resource_prefix}-${name}"
  }
}

data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

resource "aws_sfn_state_machine" "video_processing" {
  name     = "${var.resource_prefix}-video-processing"
  role_arn = aws_iam_role.step_functions.arn

  definition = jsonencode({
    # Use placeholder_arns instead of var.lambda_function_arns
    # Your state machine definition here using local.placeholder_arns
  })
}