## Main with Backend S3

/*
provider "aws" {
  version = "~> 4.0"
  region  = "ap-southeast-2"
}
*/

terraform {
    required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
   backend "s3" {
       bucket = "suhail-pipeline-test"
       key = "default"
       region = "ap-southeast-2"
   }
}