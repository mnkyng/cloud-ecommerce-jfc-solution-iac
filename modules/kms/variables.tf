variable "name" {
  description = "Nombre para la key KMS"
  type        = string
}

variable "alias_name" {
  description = "Alias de la key"
  type        = string
}

variable "description" {
  description = "Descripción de la key"
  type        = string
}

variable "deletion_window_in_days" {
  description = "Días para poder eliminar la key después de marcarla"
  type        = number
  default     = 10
}

variable "enable_key_rotation" {
  description = "Habilita la rotación automática de la key"
  type        = bool
  default     = true
}
