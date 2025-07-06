output "kms_key_id" {
  description = "ID de la key de KMS"
  value       = aws_kms_key.this.key_id
}

output "kms_key_arn" {
  description = "ARN de la key de KMS"
  value       = aws_kms_key.this.arn
}

output "kms_alias_name" {
  description = "Alias de la key"
  value       = aws_kms_alias.this.name
}
output "key_id" {
  value = aws_kms_key.this.key_id
}
