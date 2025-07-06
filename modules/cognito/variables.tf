variable "name" {
  description = "Nombre base del User Pool y App Client"
  type        = string
}

variable "callback_urls" {
  description = "URLs de callback autorizadas para el cliente"
  type        = list(string)
}

variable "logout_urls" {
  description = "URLs de logout autorizadas para el cliente"
  type        = list(string)
}

variable "tags" {
  description = "Etiquetas para el User Pool"
  type        = map(string)
  default     = {}
}
