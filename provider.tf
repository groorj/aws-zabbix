# My terraform provider
provider "aws" {
  region = var.my_aws_region
  profile = "<YOUR_AWS_PROFILE_NAME>"
  version = "~> 2.7"
}

# Terraform state file
# -- Push tfstate to S3
terraform {
  backend "s3" {
    profile = "<YOUR_AWS_PROFILE_NAME>"
    region  = "<YOUR_AWS_REGION>"
    bucket  = "<YOUR_BUCKET_NAME>"
    key     = "main.tfstate"
  }
}
