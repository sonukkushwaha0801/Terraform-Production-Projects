# WARNING:
# This file contains hardcoded credentials for learning/demo purposes only.
# Never store real production secrets directly inside Terraform files or Git repositories.
# Production teams usually avoid committing tfvars containing secrets.

aws_region              = "ap-south-1"
db_identifier           = "terraform-drift-rds"
db_name                 = "driftdb"
db_username             = "adminuser"
db_password             = "StrongPassword123!"
instance_class          = "db.t3.micro"
allocated_storage       = 20
backup_retention_period = 7
publicly_accessible     = false
