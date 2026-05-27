output "rds_identifier" {
  description = "RDS identifier"

  value = aws_db_instance.drift_rds.id
}

output "rds_endpoint" {
  description = "RDS endpoint"

  value = aws_db_instance.drift_rds.endpoint
}

output "publicly_accessible" {
  description = "Public accessibility"

  value = aws_db_instance.drift_rds.publicly_accessible
}
