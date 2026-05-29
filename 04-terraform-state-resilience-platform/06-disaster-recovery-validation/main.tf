resource "aws_s3_bucket" "primary_state" {
  bucket = var.primary_bucket_name
}

resource "aws_s3_bucket" "replica_state" {
  provider = aws.secondary

  bucket = var.replica_bucket_name
}

resource "aws_s3_bucket" "audit_logs" {
  bucket = var.audit_bucket_name
}

resource "aws_s3_bucket_versioning" "primary_state" {
  bucket = aws_s3_bucket.primary_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_versioning" "replica_state" {
  provider = aws.secondary

  bucket = aws_s3_bucket.replica_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "primary_state" {
  bucket = aws_s3_bucket.primary_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "replica_state" {
  provider = aws.secondary

  bucket = aws_s3_bucket.replica_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "primary_state" {
  bucket = aws_s3_bucket.primary_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_public_access_block" "replica_state" {
  provider = aws.secondary

  bucket = aws_s3_bucket.replica_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = var.lock_table_name
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_iam_role" "replication" {
  name = "terraform-dr-replication-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "s3.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "replication" {
  name = "terraform-dr-replication-policy"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "s3:GetReplicationConfiguration",
          "s3:ListBucket"
        ]

        Resource = [
          aws_s3_bucket.primary_state.arn
        ]
      },

      {
        Effect = "Allow"

        Action = [
          "s3:GetObjectVersion",
          "s3:GetObjectVersionAcl"
        ]

        Resource = [
          "${aws_s3_bucket.primary_state.arn}/*"
        ]
      },

      {
        Effect = "Allow"

        Action = [
          "s3:ReplicateObject",
          "s3:ReplicateDelete",
          "s3:ReplicateTags"
        ]

        Resource = [
          "${aws_s3_bucket.replica_state.arn}/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "replication" {
  role       = aws_iam_role.replication.name
  policy_arn = aws_iam_policy.replication.arn
}

resource "aws_s3_bucket_replication_configuration" "state_replication" {

  depends_on = [
    aws_s3_bucket_versioning.primary_state,
    aws_s3_bucket_versioning.replica_state
  ]

  role   = aws_iam_role.replication.arn
  bucket = aws_s3_bucket.primary_state.id

  rule {
    id     = "terraform-dr-replication"
    status = "Enabled"

    destination {
      bucket = aws_s3_bucket.replica_state.arn
    }
  }
}

resource "aws_cloudtrail" "terraform_dr" {
  name                          = "terraform-dr-trail"
  s3_bucket_name                = aws_s3_bucket.audit_logs.id
  include_global_service_events = true
  is_multi_region_trail         = true
}
