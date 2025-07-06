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
