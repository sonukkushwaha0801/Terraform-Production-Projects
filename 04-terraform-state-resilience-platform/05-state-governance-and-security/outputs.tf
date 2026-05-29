output "state_bucket_name" {
  value = aws_s3_bucket.state_bucket.bucket
}

output "audit_bucket_name" {
  value = aws_s3_bucket.audit_bucket.bucket
}

output "lock_table_name" {
  value = aws_dynamodb_table.terraform_lock.name
}

output "iam_role_name" {
  value = aws_iam_role.terraform_state_access.name
}
