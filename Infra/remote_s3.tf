## S3 state bucket
resource "aws_s3_bucket" "tfstate" {
  bucket        = "${var.env}-terraform-state"
}
resource "aws_s3_bucket_acl" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id
  acl    = "private"
}