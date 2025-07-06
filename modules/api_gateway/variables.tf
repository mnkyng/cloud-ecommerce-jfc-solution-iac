variable "name" {
  description = "Nombre de la API Gateway"
  type        = string
}

variable "description" {
  description = "Descripción de la API Gateway"
  type        = string
  default     = ""
}

variable "stage_name" {
  description = "Nombre del stage (por ejemplo, dev o prod)"
  type        = string
}

variable "route_key" {
  description = "Route key en formato METHOD /path (por ejemplo, POST /checkout)"
  type        = string
}

variable "lambda_invoke_arn" {
  description = "ARN de invocación de la función Lambda"
  type        = string
}

variable "access_log_destination_arn" {
  description = "ARN del log group de CloudWatch para los logs de acceso"
  type        = string
}

variable "access_log_format" {
  description = "Formato de logs para CloudWatch"
  type        = string
  default     = "{\"requestId\":\"$context.requestId\",\"ip\":\"$context.identity.sourceIp\",\"requestTime\":\"$context.requestTime\",\"httpMethod\":\"$context.httpMethod\",\"routeKey\":\"$context.routeKey\",\"status\":\"$context.status\"}"
}

variable "throttling_rate_limit" {
  description = "Límite de velocidad por segundo"
  type        = number
  default     = 100
}

variable "throttling_burst_limit" {
  description = "Límite de ráfaga"
  type        = number
  default     = 50
}
