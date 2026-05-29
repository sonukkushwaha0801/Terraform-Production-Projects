output "backup_bucket_name" {
  value = aws_s3_bucket.state_backup.bucket
}

output "backup_bucket_arn" {
  value = aws_s3_bucket.state_backup.arn
}

output "versioning_status" {
  value = aws_s3_bucket_versioning.state_backup.versioning_configuration[0].status
}

output "retention_period" {
  value = var.retention_days
}
