resource "aws_ses_email_identity" "this" {
  email = var.verified_email
}

resource "aws_ses_identity_policy" "default" {
  name       = "${var.name}-policy"
  identity   = aws_ses_email_identity.this.email
  policy     = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = [
        "ses:SendEmail",
        "ses:SendRawEmail"
      ],
      Resource = "*"
    }]
  })
}
