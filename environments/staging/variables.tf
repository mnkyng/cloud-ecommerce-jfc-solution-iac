variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod, etc.)"
  type        = string
}

variable "project" {
  description = "Nombre del proyecto"
  type        = string
  default     = "cloud-ecommerce-jfc"
}

variable "env" {
  description = "Nombre del entorno"
  type        = string
  default     = "dev"
}

variable "region" {
  description = "Región de AWS"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {}
variable "private_subnets" {
  type = list(string)
}
variable "public_subnets" {
  type = list(string)
}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}

variable "azs" {
  type = list(string)
}
