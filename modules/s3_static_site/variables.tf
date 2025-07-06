variable "bucket_name" {
  description = "Nombre del bucket S3"
  type        = string
}

variable "enable_versioning" {
  description = "Habilita el versionado en el bucket"
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "ID de la clave KMS usada para encriptar objetos"
  type        = string
}

variable "tags" {
  description = "Etiquetas comunes"
  type        = map(string)
  default     = {}
}
