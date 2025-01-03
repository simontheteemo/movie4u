resource "aws_sfn_state_machine" "video_processing" {
  name     = "${var.resource_prefix}-video-processing"
  role_arn = aws_iam_role.step_functions.arn

  definition = jsonencode({
    StartAt = "InitializeJob"
    States = {
      InitializeJob = {
        Type = "Task"
        Resource = var.lambda_function_arns["initializer"]
        Next = "ParallelProcessing"
        Retry = [{
          ErrorEquals = ["States.ALL"]
          IntervalSeconds = 2
          MaxAttempts = 3
          BackoffRate = 2
        }]
        Catch = [{
          ErrorEquals = ["States.ALL"]
          Next = "FailState"
        }]
      }
      ParallelProcessing = {
        Type = "Parallel"
        Branches = [
          {
            StartAt = "VideoAnalysis"
            States = {
              VideoAnalysis = {
                Type = "Task"
                Resource = var.lambda_function_arns["video_analyzer"]
                End = true
              }
            }
          },
          {
            StartAt = "AudioProcessing"
            States = {
              AudioProcessing = {
                Type = "Task"
                Resource = var.lambda_function_arns["audio_processor"]
                End = true
              }
            }
          }
        ]
        Next = "ResultCombiner"
        Catch = [{
          ErrorEquals = ["States.ALL"]
          Next = "FailState"
        }]
      }
      ResultCombiner = {
        Type = "Task"
        Resource = var.lambda_function_arns["result_combiner"]
        End = true
      }
      FailState = {
        Type = "Fail",
        Cause = "Video Processing Failed"
      }
    }
  })
}
