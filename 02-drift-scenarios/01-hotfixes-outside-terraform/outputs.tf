output "instance_id" {
  description = "EC2 Instance ID"
  value = aws_instance.hotfix_server.id
}

output "public_ip" {
  description = "Public IP of EC2 instance"
  value = aws_instance.hotfix_server.public_ip
}

output "instance_type" {
  description = "Current EC2 instance type"
  value = aws_instance.hotfix_server.instance_type
}
