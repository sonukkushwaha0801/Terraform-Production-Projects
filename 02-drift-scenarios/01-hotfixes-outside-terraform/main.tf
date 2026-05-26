resource "aws_security_group" "hotfix_sg" {
  name        = "hotfix-drift-sg"
  description = "Security group for drift detection project"

  ingress {
    description = "SSH Access"

    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [var.ssh_allowed_ip]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "hotfix-drift-sg"
    Environment = "Production"
    Project     = "Drift-Detection"
    Scenario    = "Hotfix-Outside-Terraform"
    ManagedBy   = "Terraform"
  }
}

resource "aws_instance" "hotfix_server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [
    aws_security_group.hotfix_sg.id
  ]

  tags = {
    Name        = var.instance_name
    Environment = "Production"
    Project     = "Drift-Detection"
    Scenario    = "Hotfix-Outside-Terraform"
    ManagedBy   = "Terraform"
  }
}
