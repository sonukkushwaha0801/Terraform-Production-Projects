variable "region" {
  description = "Provide AWS region"
  type        = string
  default     = "us-east-1"
}

variable "security_group_id" {
  description = "Existing Security Group ID"
  type        = string
}
