variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = "vpc-xxxxxxxx"
}

variable "subnet_ids" {
  description = "Public subnet IDs"
  type        = list(string)
  default     = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]
}

variable "alb_name" {
  description = "Application Load Balancer name"
  type        = string
  default     = "terraform-drift-alb"
}

variable "listener_port" {
  description = "ALB listener port"
  type        = number
  default     = 80
}
