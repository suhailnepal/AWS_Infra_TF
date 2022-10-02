## State file 

required_version = ">=0.14.9" 

   backend "s3" {
       bucket = "suhail-pipeline-test"
       key    = "/"
       region = "ap-southeast-2"
   }