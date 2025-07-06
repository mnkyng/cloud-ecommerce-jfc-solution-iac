module "vpc" {
  source = "./modules/vpc"
  name   = var.project_name
}

module "rds" {
  source        = "./modules/rds"
  project_name  = var.project_name
  db_username   = var.db_username
  db_password   = var.db_password
  vpc_id        = module.vpc.vpc_id
  subnet_ids    = module.vpc.private_subnet_ids
}

module "redis" {
  source = "./modules/redis"
  vpc_id = module.vpc.vpc_id
}

module "cognito" {
  source = "./modules/cognito"
  project_name = var.project_name
}

module "apigateway" {
  source = "./modules/api_gateway"
  project_name     = var.project_name
  cognito_userpool = module.cognito.user_pool_id
}

module "cloudwatch" {
  source = "./modules/cloudwatch"
  project_name = var.project_name
}

module "s3" {
  source = "./modules/s3"
  bucket_name = "${var.project_name}-frontend-assets"
}
