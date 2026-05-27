resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "Terraform managed CPU alarm"
  dimensions = {
    InstanceId = var.instance_id
  }

  treat_missing_data = "missing"
  tags = {
    Environment = "Production"
    Project     = "Drift-Detection"
    Scenario    = "CloudWatch-Monitoring-Drift"
    ManagedBy   = "Terraform"
  }
}
