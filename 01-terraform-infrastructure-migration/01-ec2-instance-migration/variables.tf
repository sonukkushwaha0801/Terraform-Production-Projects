variable "region" {
  description = "Provide AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_id" {
  description = "The Instance ID of the Instance"
  type        = string
  default     = null
}

variable "instance_type" {
  description = "The Instance type of the Instance"
  type        = string
  default     = null
}

variable "instance_reference_name" {
  description = "Reference name used for EC2 resource"
  type        = string
  default     = "example"
}
