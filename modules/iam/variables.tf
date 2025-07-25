variable "role_name" {
  description = "Nombre del IAM Role"
  type        = string
}

variable "assume_role_policy" {
  description = "JSON para la política de confianza (assume role)"
  type        = string
}

variable "policy_name" {
  description = "Nombre de la policy"
  type        = string
}

variable "policy_description" {
  description = "Descripción de la policy"
  type        = string
  default     = ""
}

variable "policy_document" {
  description = "JSON con las políticas"
  type        = string
}
variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
  default     = "jfc"
}

variable "environment" {
  description = "Entorno"
  type        = string
  default     = "dev"
}

variable "policies_path" {
  description = "Ruta local de las políticas JSON"
  type        = string
  default     = "./policies"
}
variable "description" {}
