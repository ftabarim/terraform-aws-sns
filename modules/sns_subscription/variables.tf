variable "endpoint" {
  type        = string
  description = "Descreva o e-mail ou telefone"
}

variable "protocol" {
  type        = string
  description = "Escolha entre SMS ou e-mail"
}

variable "topic_arn" {
  type = string
}
