variable "name" {
  description = "Nombre del cluster Redis"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

variable "subnet_ids" {
  description = "Lista de subnets privadas"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Lista de security groups permitidos"
  type        = list(string)
}