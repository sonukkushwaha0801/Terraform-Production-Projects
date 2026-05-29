output "primary_bucket_name" {
  value = aws_s3_bucket.primary_state.bucket
}

output "replica_bucket_name" {
  value = aws_s3_bucket.replica_state.bucket
}

output "lock_table_name" {
  value = aws_dynamodb_table.terraform_lock.name
}

output "replication_role_name" {
  value = aws_iam_role.replication.name
}

output "cloudtrail_name" {
  value = aws_cloudtrail.terraform_dr.name
}
