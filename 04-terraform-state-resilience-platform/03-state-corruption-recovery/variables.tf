variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "environment" {
  type    = string
  default = "testing"
}

variable "owner" {
  type    = string
  default = "platform-team"
}

variable "cost_center" {
  type    = string
  default = "cc-1001"
}

variable "state_bucket_name" {
  type    = string
  default = "terraform-corruption-recovery-demo"
}

variable "lock_table_name" {
  type    = string
  default = "terraform-corruption-locks"
}

variable "ami_id" {
  type    = string
  default = "ami-0f58b397bc5c1f2e8"
}

variable "instance_type" {
  type    = string
  default = "t2.small"
}
