## Main with Backend S3

provider "aws" {
  version = "~> 4.0"
  region  = "ap-southeast-2"
}

terraform {
  required_version = ">=0.14.9"
   backend "s3" {
       bucket = "suhail-pipeline-test"
       key = "default"
       region = "ap-southeast-2"
   }
}