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
            StartAt = "ProcessVideo"
            States = {
              ProcessVideo = {
                Type = "Task"
                Resource = var.lambda_function_arns["video_analyzer"]
                Next = "WaitForLabels"
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
              WaitForLabels = {
                Type = "Wait"
                Seconds = 30
                Next = "CheckLabels"
              }
              CheckLabels = {
                Type = "Task"
                Resource = var.lambda_function_arns["label_checker"]
                Next = "LabelsComplete?"
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
              "LabelsComplete?" = {
                Type = "Choice"
                Choices = [
                  {
                    Variable = "$.labelDetectionStatus"
                    StringEquals = "SUCCEEDED"
                    Next = "GenerateVisualNarrative"
                  }
                ],
                Default = "WaitForLabels"
              }
              GenerateVisualNarrative = {
                Type = "Task"
                Resource = var.lambda_function_arns["narrative_generator"]
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
                End = true
              }
            }
          },
          {
            StartAt = "ProcessAudioAndTranscribe"
            States = {
              ProcessAudioAndTranscribe = {
                Type = "Task"
                Resource = var.lambda_function_arns["audio_processor"]
                Next = "WaitForTranscription"
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
              WaitForTranscription = {
                Type = "Wait"
                Seconds = 30
                Next = "CheckTranscription"
              }
              CheckTranscription = {
                Type = "Task"
                Resource = var.lambda_function_arns["transcription_checker"]
                Next = "TranscriptionComplete?"
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
              "TranscriptionComplete?" = {
                Type = "Choice"
                Choices = [
                  {
                    Variable = "$.transcriptionStatus"
                    StringEquals = "COMPLETED"
                    End = true
                  }
                ],
                Default = "WaitForTranscription"
              }
            }
          }
        ]
        Next = "FinalizeResults"
        Catch = [{
          ErrorEquals = ["States.ALL"]
          Next = "FailState"
        }]
      }

      FinalizeResults = {
        Type = "Task"
        Resource = var.lambda_function_arns["result_combiner"]
        Next = "SaveResults"
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

      SaveResults = {
        Type = "Task"
        Resource = var.lambda_function_arns["result_saver"]
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
        End = true
      }

      FailState = {
        Type = "Task"
        Resource = var.lambda_function_arns["failure_handler"]
        End = true
      }
    }
  })
} 