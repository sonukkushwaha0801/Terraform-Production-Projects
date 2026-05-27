variable "aws_region" {
  description = "AWS region where Route53 infrastructure will be managed"
  type        = string
  default     = "ap-south-1"
}

variable "hosted_zone_id" {
  description = "Existing Route53 Hosted Zone ID used for DNS record management"
  type        = string
  default     = "ZXXXXXXXXXXXXX"
}

variable "domain_name" {
  description = "Production domain or subdomain managed through Route53"
  type        = string
  default     = "drift.example.com"
}

variable "record_ip" {
  description = "Target IPv4 address associated with the Route53 DNS A record"
  type        = string
  default     = "1.1.1.1"
}
