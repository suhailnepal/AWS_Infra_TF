resource "aws_s3_bucket" "s3Bucket" {
     bucket = "suhail-dev-pipeline"
     acl       = "public-read"

     policy  = <<EOF
{
     "id" : "MakePublic",
   "version" : "2012-10-17",
   "statement" : [
      {
         "action" : [
             "s3:GetObject"
          ],
         "effect" : "Allow",
         "resource" : "arn:aws:s3:::suhail-dev-pipeline/*",
         "principal" : "*"
      }
    ]
  }
EOF

   website {
       index_document = "index.html"
   }
}

## State file 

required_version = ">=0.14.9" 

   backend "s3" {
       bucket = aws_s3_bucket.s3Bucket.name
       key    = "/"
       region = "ap-southeast-2"
   }