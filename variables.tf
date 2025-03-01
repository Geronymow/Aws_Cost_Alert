variable "region" {
  type        = string
  description = "A região dos recursos a serem criados"
  default     = "us-east-1"
}

variable "endpointEmail" {
  type        = string
  description = "E-mail para receber notificações do SNS"
  default     = "XXXXXXXXXXXXXXXXXXXXXX"
}

variable "budget_name" {
  type        = string
  description = "Nome do budget"
  default     = "aws-monthly-cost"
}

variable "budget_type" {
  type        = string
  description = "Tipo de budget"
  default     = "COST"
}

variable "limit_amount" {
  type        = string
  description = "Valor do budget"
  default     = "XXXX" # Insira o valor que desejar
}

variable "limit_unit" {
  type        = string
  description = "Unidade do valor do budget"
  default     = "USD"
}

variable "time_unit" {
  type        = string
  description = "Período de avaliação do budget"
  default     = "MONTHLY"
}

variable "subscriber_email_addresses" {
  type        = list(string)
  description = "Lista de emails para receber o alerta"
  default     = null
}

variable "subscriber_sns_topic_arns" {
  type        = string
  description = "tópico SNS para receber o alerta"
  default     = null
}