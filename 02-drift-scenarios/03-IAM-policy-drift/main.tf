resource "aws_iam_role" "ec2_role" {
  name = var.role_name


  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
  ]

  tags = {
    Name        = var.role_name
    Environment = "Production"
    Project     = "Drift-Detection"
    Scenario    = "IAM-Policy-Drift"
    ManagedBy   = "Terraform"
  }
}

resource "aws_iam_role_policy_attachment" "s3_readonly" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = var.instance_profile_name
  role = aws_iam_role.ec2_role.name
}

resource "aws_instance" "iam_drift_server" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name

  tags = {
    Name        = var.instance_name
    Environment = "Production"
    Project     = "Drift-Detection"
    Scenario    = "IAM-Policy-Drift"
    ManagedBy   = "Terraform"
  }
}
