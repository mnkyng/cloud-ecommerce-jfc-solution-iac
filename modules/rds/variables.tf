variable "db_name" {
  description = "Nombre de la base de datos"
  type        = string
}

variable "db_username" {
  description = "Usuario administrador"
  type        = string
}

variable "db_password" {
  description = "Contraseña del administrador"
  type        = string
  sensitive   = true
}

variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

variable "subnet_ids" {
  description = "Subredes privadas para el clúster de Aurora"
  type        = list(string)
}

variable "allowed_security_groups" {
  description = "Security Groups que pueden acceder al RDS"
  type        = list(string)
  default     = []
}

variable "db_port" {
  description = "Puerto para la base de datos"
  type        = number
  default     = 5432
}

variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
}

variable "environment" {
  description = "Nombre del entorno (dev, prod, etc.)"
  type        = string
}

variable "project" {}
variable "private_subnet_ids" {
  type = list(string)
}

variable "master_username" {
  type = string
}

variable "master_password" {
  type = string
  sensitive = true
}

variable "security_group_id" {
  type = string
}

variable "instance_class" {
  description = "Clase de instancia para RDS"
  type        = string
}

