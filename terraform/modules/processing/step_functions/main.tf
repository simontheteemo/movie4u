locals {
  state_machine_definition = templatefile("${path.module}/state_machine_definition.json.tpl", {
    lambda_arns = var.lambda_function_arns
  })
  
  common_retry = [
    {
      ErrorEquals = ["States.ALL"]
      IntervalSeconds = 2
      MaxAttempts = 3
      BackoffRate = 2
    }
  ]
  
  common_catch = [
    {
      ErrorEquals = ["States.ALL"]
      Next = "FailState"
    }
  ]
}

resource "aws_sfn_state_machine" "video_processing" {
  name     = "${var.resource_prefix}-video-processing"
  role_arn = aws_iam_role.step_functions.arn
  definition = local.state_machine_definition
  
  depends_on = [aws_iam_role.step_functions]
}