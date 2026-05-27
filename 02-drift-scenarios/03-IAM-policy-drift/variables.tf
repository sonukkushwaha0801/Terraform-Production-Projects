variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "role_name" {
  description = "IAM role name"
  type        = string
  default     = null
}

variable "instance_profile_name" {
  description = "IAM instance profile name"
  type        = string
  default     = null
}

variable "instance_name" {
  description = "EC2 instance name"
  type        = string
  default     = "Server-1"
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
