output "cloudwatch_log_group_name" {
  description = "Nombre del log group creado"
  value       = aws_cloudwatch_log_group.this.name
}

output "cloudwatch_log_group_arn" {
  description = "ARN del log group"
  value       = aws_cloudwatch_log_group.this.arn
}
