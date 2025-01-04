terraform {
  backend "s3" {
    bucket = "movie4u-terraform-state-dev"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region = var.aws_region
}

module "video_processing" {
  source = "../../"
  
  environment = "dev"
  aws_region = var.aws_region
  mediaconvert_endpoint = var.mediaconvert_endpoint
}
