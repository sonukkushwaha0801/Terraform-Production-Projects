output "container_insights_log_group" {
  value = aws_cloudwatch_log_group.container_insights.name
}

output "alb_controller_role" {
  value = aws_iam_role.alb_controller.name
}

output "operations_security_group" {
  value = aws_security_group.platform_operations.id
}
