variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "launch_template_name" {
  description = "Launch template name"
  type        = string
  default     = "terraform-drift-launch-template"
}

variable "autoscaling_group_name" {
  description = "Auto Scaling Group name"
  type        = string
  default     = "terraform-drift-asg"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.small"
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
  type        = string
  default     = "ami-0685bcc683dadb6b9"
}

variable "desired_capacity" {
  description = "Desired instance count"
  type        = number
  default     = 0
}

variable "min_size" {
  description = "Minimum instance count"
  type        = number
  default     = 0
}

variable "max_size" {
  description = "Maximum instance count"
  type        = number
  default     = 0
}
