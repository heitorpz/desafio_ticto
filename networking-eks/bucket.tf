# Create bucket AWS-S3
resource "aws_s3_bucket" "terraform-state-storage-s3" {
  bucket = var.bucket_name

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = merge(
    {
      Name = "terraform-state-storage-s3",
    },
    var.tags,
  )
}

# create a dynamodb table for locking the state file
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = var.dynamodb_table_name
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = merge(
    {
      Name = "DynamoDB Terraform State Lock Table",
    },
    var.tags,
  )
}