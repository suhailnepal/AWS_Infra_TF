terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>3.0"
    }
  }

  required_version = ">=0.14.9"
  
   backend "s3" {
       bucket = "suhail-pipeline-test"
       region = "ap-southeast-2"
   }
}

provider "aws" {
  version = "~>3.0"
  region  = "ap-southeast-2"
}