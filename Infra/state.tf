## S3 state bucket
resource "aws_s3_bucket" "tfstate" {
  bucket = "${var.env}-terraform-state"
}
resource "aws_s3_bucket_acl" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id
  acl    = "private"
}

## DynamoDB Lock

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = "${var.env}-state-lock-dynamo"
  hash_key       = "LockID"
  read_capacity  = 1
  write_capacity = 1

  attribute {
    name = "LockID"
    type = "S"
  }
}