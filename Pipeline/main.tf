## Main with Backend S3..

provider "aws" {
  version = "~> 3.0"
  region  = "ap-southeast-2"
}

terraform {
   backend "s3" {
       bucket = "suhail-pipeline-test"
       key = "default"
       region = "ap-southeast-2"
   }
}