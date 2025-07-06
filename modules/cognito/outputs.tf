output "user_pool_id" {
  description = "ID del Cognito User Pool"
  value       = aws_cognito_user_pool.this.id
}

output "user_pool_arn" {
  description = "ARN del Cognito User Pool"
  value       = aws_cognito_user_pool.this.arn
}

output "app_client_id" {
  description = "ID del App Client"
  value       = aws_cognito_user_pool_client.this.id
}
