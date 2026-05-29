variable "aws_region" {
  description = "AWS deployment region"
  type        = string
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "owner" {
  description = "Resource owner"
  type        = string
}

variable "cost_center" {
  description = "Cost allocation tag"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID used by platform operations resources"
  type        = string
}
