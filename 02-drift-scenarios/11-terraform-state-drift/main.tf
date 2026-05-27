resource "aws_instance" "state_drift_server" {
  ami = var.ami_id

  instance_type = var.instance_type

  tags = {
    Name        = var.instance_name
    Environment = "Production"
    Project     = "Drift-Detection"
    Scenario    = "Terraform-State-Drift"
    ManagedBy   = "Terraform"
  }
}
