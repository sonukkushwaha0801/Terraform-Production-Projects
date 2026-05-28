resource "aws_security_group" "public_ssh_sg" {
  name        = "public-ssh-governance-demo"
  description = "Intentional governance violation"
  # comment from here
  ingress {
    description = "Public SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # to here, for executing GitHub Action Successfully.
  tags = {
    Name        = "public-ssh-demo"
    Environment = "dev"
  }
}
