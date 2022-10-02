## Main with Backend S3

provider "aws" {
  version = "~>3.0"
  region  = "ap-southeast-2"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>3.27"
    }
  }

required_version = ">=1.3.0"

   backend "s3" {
       bucket = "suhail-pipeline-test"
       region = "ap-southeast-2"
   }
}

terraform {
  required_version = ">0.14.7"
  backend "s3" {}

  required_providers {
    aws = {
      version = ">= 3.66.0"
      source  = "hashicorp/aws"
    }
  }
}