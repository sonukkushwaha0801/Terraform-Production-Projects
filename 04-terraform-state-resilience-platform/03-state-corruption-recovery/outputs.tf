output "state_bucket_name" {
  value = aws_s3_bucket.terraform_state.bucket
}

output "lock_table_name" {
  value = aws_dynamodb_table.terraform_lock.name
}

output "ec2_instance_id" {
  value = aws_instance.recovery_server.id
}

output "ec2_public_ip" {
  value = aws_instance.recovery_server.public_ip
}
