variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "instance_name" {
  description = "EC2 instance name"
  type        = string
  default     = "Server-created"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.xlarge"
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
  type        = string
  default     = "ami-094006acf6bc32629"
}

variable "ssh_allowed_ip" {
  description = "Allowed IP for SSH access"
  type        = string
}
