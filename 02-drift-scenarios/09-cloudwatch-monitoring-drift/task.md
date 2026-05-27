output "alarm_name" {
  value = aws_cloudwatch_metric_alarm.cpu_alarm.alarm_name
}

output "alarm_threshold" {
  value = aws_cloudwatch_metric_alarm.cpu_alarm.threshold
}
