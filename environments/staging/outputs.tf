output "vpc_id" {
  value = module.vpc.vpc_id
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "redis_endpoint" {
  value = module.redis.redis_endpoint
}

output "dynamodb_table_name" {
  value = module.dynamodb.table_name
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}

output "cognito_user_pool_id" {
  value = module.cognito.user_pool_id
}

output "kms_key_id" {
  value = module.kms.key_id
}

output "api_gateway_id" {
  value = module.apigateway.api_id
}
