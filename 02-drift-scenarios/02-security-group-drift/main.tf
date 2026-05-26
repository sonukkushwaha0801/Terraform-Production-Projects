resource "aws_security_group" "security_drift_sg" {
  name        = "security-drift-sg"
  description = "Security group for drift detection project"

  ingress {
    description = "Restricted SSH Access"

    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [var.allowed_ssh_cidr]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "security-drift-sg"
    Environment = "Production"
    Project     = "Drift-Detection"
    Scenario    = "Security-Group-Drift"
    ManagedBy   = "Terraform"
  }
}

resource "aws_instance" "security_drift_server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [
    aws_security_group.security_drift_sg.id
  ]

  tags = {
    Name        = var.instance_name
    Environment = "Production"
    Project     = "Drift-Detection"
    Scenario    = "Security-Group-Drift"
    ManagedBy   = "Terraform"
  }
}
