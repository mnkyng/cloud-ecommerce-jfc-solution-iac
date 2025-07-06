output "api_id" {
  description = "ID de la API Gateway"
  value       = aws_apigatewayv2_api.this.id
}

output "api_endpoint" {
  description = "Endpoint público de la API"
  value       = aws_apigatewayv2_api.this.api_endpoint
}

output "stage_name" {
  description = "Nombre del stage"
  value       = aws_apigatewayv2_stage.default.name
}
