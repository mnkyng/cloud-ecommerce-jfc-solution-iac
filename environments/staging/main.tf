module "vpc" {
  source = "../../modules/vpc"
  project_name = var.project_name
  environment  = var.environment
  region       = var.region
}

module "rds" {
  source = "../../modules/rds"
  project_name = var.project_name
  environment  = var.environment
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.private_subnets
  db_username  = var.db_username
  db_password  = var.db_password
}

module "redis" {
  source = "../../modules/redis"
  project_name = var.project_name
  environment  = var.environment
  subnet_ids   = module.vpc.private_subnets
  vpc_id       = module.vpc.vpc_id
}

module "dynamodb" {
  source = "../../modules/dynamodb"
  project_name = var.project_name
  environment  = var.environment
}

module "s3" {
  source = "../../modules/s3"
  project_name = var.project_name
  environment  = var.environment
}

module "cloudwatch" {
  source = "../../modules/cloudwatch"
  project_name = var.project_name
  environment  = var.environment
}

module "cognito" {
  source = "../../modules/cognito"
  project_name = var.project_name
  environment  = var.environment
}

module "kms" {
  source = "../../modules/kms"
  project_name = var.project_name
  environment  = var.environment
}

module "apigateway" {
  source = "../../modules/apigateway"
  project_name = var.project_name
  environment  = var.environment
}

module "iam" {
  source = "../../modules/iam"
  project_name = var.project_name
  environment  = var.environment
  policies_path = "./policies"
}

module "lambda_iam_role" {
  source              = "../../modules/iam"
  role_name           = "lambda-checkout-role"
  assume_role_policy  = file("${path.module}/policies/lambda_assume.json")
  policy_name         = "lambda-checkout-policy"
  policy_description  = "Permite acceso a DynamoDB, RDS y S3"
  policy_document     = file("${path.module}/policies/lambda_checkout_policy.json")
}
