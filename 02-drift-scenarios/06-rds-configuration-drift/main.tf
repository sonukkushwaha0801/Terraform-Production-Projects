resource "aws_db_instance" "drift_rds" {
  identifier = var.db_identifier

  allocated_storage = var.allocated_storage

  engine         = "mysql"
  engine_version = "8.0"

  instance_class = var.instance_class

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  publicly_accessible = var.publicly_accessible

  backup_retention_period = var.backup_retention_period

  skip_final_snapshot = true

  deletion_protection = true

  storage_encrypted = true

  tags = {
    Name        = var.db_identifier
    Environment = "Production"
    Project     = "Drift-Detection"
    Scenario    = "RDS-Configuration-Drift"
    ManagedBy   = "Terraform"
  }
}
