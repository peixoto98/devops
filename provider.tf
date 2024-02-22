terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.37.0"
    }
  }
  # backend "s3" {
  #   bucket = "terraform"
  #   key    = "hml/terraform.tfstate"
  #   region = "us-east-1"
  # }
}

provider "aws" {}
#export AWS_ACCESS_KEY_ID="anaccesskey"
#export AWS_SECRET_ACCESS_KEY="asecretkey"
#export AWS_REGION="us-east-1"

