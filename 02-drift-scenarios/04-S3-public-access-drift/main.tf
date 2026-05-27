resource "aws_s3_bucket" "private_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = "Production"
    Project     = "Drift-Detection"
    Scenario    = "S3-Public-Access-Drift"
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket_public_access_block" "private_access" {
  bucket = aws_s3_bucket.private_bucket.id

  block_public_acls  = true
  ignore_public_acls = true

  block_public_policy     = true
  restrict_public_buckets = true
}
