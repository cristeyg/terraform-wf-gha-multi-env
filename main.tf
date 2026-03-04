provider "aws" {
  region = var.aws_region
}


# Create S3 bucket with workspace name
resource "aws_s3_bucket" "env_bucket" {
  bucket = "my-demo-${terraform.workspace}-bucket-12345"

  tags = {
    Environment = terraform.workspace
  }
}


output "workspace_name" {
  value = terraform.workspace
}

output "bucket_name" {
  value = aws_s3_bucket.env_bucket.bucket
}
