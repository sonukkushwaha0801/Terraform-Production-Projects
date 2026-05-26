variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "instance_name" {
  description = "EC2 instance name"
  type        = string
  default     = "Server-Machine"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.small"
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
  type        = string
  default     = "ami-07a00cf47dbbc844c"
}

variable "allowed_ssh_cidr" {
  description = "Allowed CIDR for SSH access"
  type        = string
  default = "0.0.0.0/0"
}
