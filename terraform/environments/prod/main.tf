terraform {
  backend "s3" {
    bucket = "movie4u-terraform-state-prod"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region = var.aws_region
}

module "video_processing" {
  source = "../../"
  
  environment = "prod"
  aws_region = var.aws_region
  mediaconvert_endpoint = var.mediaconvert_endpoint
}
