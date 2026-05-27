output "autoscaling_group_name" {
  description = "Auto Scaling Group name"
  value       = aws_autoscaling_group.drift_asg.name
}

output "desired_capacity" {
  description = "Desired instance count"
  value       = aws_autoscaling_group.drift_asg.desired_capacity
}

output "launch_template_id" {
  description = "Launch template ID"
  value       = aws_launch_template.drift_template.id
}
