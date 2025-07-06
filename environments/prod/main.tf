module "iam" {
  source             = "../../modules/iam"
  role_name          = "${var.project_name}-lambda-role-${var.environment}"
  assume_role_policy = file("${path.module}/policies/assume-role.json")
  policy_name        = "${var.project_name}-lambda-policy-${var.environment}"
  policy_document    = file("${path.module}/policies/lambda-policy.json")
  description = "IAM para ${var.project_name} (${var.environment})"
}

module "vpc" {
  source          = "../../modules/vpc"
  vpc_cidr = var.vpc_cidr
  cidr_block      = var.vpc_cidr
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  region          = var.region
  environment     = var.environment
  name            = "${var.project_name}-${var.environment}"
  azs            = var.azs

}

resource "aws_security_group" "rds_sg" {
  name        = "rds-sg-${var.environment}"
  description = "Security Group for RDS"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "rds-sg-${var.environment}"
    Environment = var.environment
    Project     = var.project_name
  }
}




module "dynamodb" {
  source     = "../../modules/dynamodb"
  table_name = "${var.project_name}-cart-${var.environment}"
}


module "kms" {
  source      = "../../modules/kms"
  name        = "kms-key-${var.environment}"
  alias_name  = "alias/kms-key-${var.environment}"
  description = "KMS key for ${var.project_name} (${var.environment})"
}


module "s3" {
  source       = "../../modules/s3_static_site"
  bucket_name  = "cloud-ecommerce-static-${var.environment}"
  kms_key_id   = module.kms.kms_key_arn
  project_name = var.project_name
  environment  = var.environment
}



module "cloudwatch" {
  source = "../../modules/cloudwatch"
  name = "${var.project_name}-cloudwatch-${var.environment}"
}

module "cognito" {
  source        = "../../modules/cognito"
  project_name  = var.project_name
  environment   = var.environment
  name          = "${var.project_name}-user-pool-${var.environment}"
  callback_urls = ["https://example.com/callback"]
  logout_urls   = ["https://example.com/logout"]
}

module "apigateway" {
  source = "../../modules/api_gateway"
  name                         = "${var.project_name}-apigateway-${var.environment}"
  route_key                    = "GET /status"
  stage_name                   = "prod"
  lambda_invoke_arn           = "arn:aws:lambda:us-east-1:123456789012:function:example" # Sustituye por el ARN de la Cuenta
  access_log_destination_arn  = "arn:aws:logs:us-east-1:123456789012:log-group:/aws/apigateway/example" # Sustituye por tu log group
}


module "redis" {
  source             = "../../modules/redis"
  name               = "redis-${var.environment}"
  subnet_ids         = module.vpc.private_subnet_ids
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids  = module.vpc.private_subnet_ids
  security_group_ids = [module.redis.security_group_id]
  environment = var.environment
  project_name = var.project_name
  instance_class = "db.t4g.medium"
}



module "rds" {
  source = "../../modules/rds"
  db_name = var.db_name
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.private_subnet_ids
  db_username  = var.db_username
  db_password  = var.db_password
  master_username    = var.db_username
  master_password    = var.db_password
  environment  = var.environment
  project            = var.project_name
  private_subnet_ids = module.vpc.private_subnet_ids
  security_group_id  = aws_security_group.rds_sg.id
  project_name       = var.project_name
  instance_class     = "db.t4g.medium" # o la clase que elijas
}
