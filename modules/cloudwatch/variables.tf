variable "name" {
  description = "Nombre del log group"
  type        = string
}

variable "retention_in_days" {
  description = "Retención en días"
  type        = number
  default     = 30
}

variable "kms_key_id" {
  description = "KMS Key ID para encriptar los logs (opcional)"
  type        = string
  default     = null
}

variable "tags" {
  description = "Etiquetas para el log group"
  type        = map(string)
  default     = {}
}

variable "project_name" {
  type        = string
  description = "Nombre del proyecto"
  default     = "cloud-ecommerce-jfc"
}

variable "environment" {
  type        = string
  description = "Ambiente de despliegue"
  default     = "dev"
}
