output "role_arn" {
  description = "ARN del IAM Role creado"
  value       = aws_iam_role.this.arn
}

output "policy_arn" {
  description = "ARN de la policy creada"
  value       = aws_iam_policy.this.arn
}
