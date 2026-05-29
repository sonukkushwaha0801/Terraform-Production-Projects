output "vpc_id" {
  value = aws_vpc.eks_vpc.id
}

output "private_subnet_a" {
  value = aws_subnet.private_a.id
}

output "private_subnet_b" {
  value = aws_subnet.private_b.id
}

output "cluster_log_group" {
  value = aws_cloudwatch_log_group.eks_logs.name
}
