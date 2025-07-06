output "api_gateway_url" {
  value = module.apigateway.api_url
}

output "cognito_pool_id" {
  value = module.cognito.user_pool_id
}
