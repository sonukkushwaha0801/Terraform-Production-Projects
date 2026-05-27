output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.iam_drift_server.id
}

output "iam_role_name" {
  description = "IAM role name"
  value       = aws_iam_role.ec2_role.name
}

output "instance_profile_name" {
  description = "IAM instance profile name"
  value       = aws_iam_instance_profile.instance_profile.name
}
