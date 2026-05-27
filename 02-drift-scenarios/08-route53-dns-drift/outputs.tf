output "dns_record_name" {
  value = aws_route53_record.dns_record.name
}

output "dns_record_value" {
  value = aws_route53_record.dns_record.records
}
