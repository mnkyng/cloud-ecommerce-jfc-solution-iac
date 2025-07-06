output "verified_email" {
  description = "Correo verificado para envío con SES"
  value       = aws_ses_email_identity.this.email
}
