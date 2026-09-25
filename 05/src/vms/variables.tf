###cloud vars
# variable "token" {
#   type        = string
#   description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
# }

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}


variable "cidr_develop_a" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "cidr_develop_b" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "username" {
  type        = string
  description = "Имя пользователя в ВМ"
  default     = "ubuntu"
}

variable "ssh_public_key" {
  type    = string
  description = "ssh public key"
}

/* variable "ip" {
  type        = string
  description = "ip-адрес"

  # Верное значение
  default = "192.168.0.1"

  validation {
    condition     = can(cidrhost("${var.ip}/32", 0)) && cidrhost("${var.ip}/32", 0) == var.ip
    error_message = "Значение должно быть корректным IPv4-адресом, например 192.168.0.1."
  }
}
*/
/*variable "ips" {
  type        = list(string)
  description = "список ip-адресов"

  # Верные значения
  default = ["192.168.0.1", "1.1.1.1", "127.0.0.1"]

  validation {
    condition = alltrue([
      for ip in var.ips :
      can(cidrhost("${ip}/32", 0)) && cidrhost("${ip}/32", 0) == ip
    ])
    error_message = "Все элементы списка должны быть корректными IPv4-адресами."
  }
}
*/
/*variable "ip" {
  type        = string
  description = "ip-адрес"
  default     = "1920.1680.0.1"   # неверный IP

  validation {
    condition     = can(cidrhost("${var.ip}/32", 0)) && cidrhost("${var.ip}/32", 0) == var.ip
    error_message = "Значение должно быть корректным IPv4-адресом, например 192.168.0.1."
  }
}
*/
/*
variable "ips" {
  type        = list(string)
  description = "список ip-адресов"
  default     = ["192.168.0.1", "1.1.1.1", "1270.0.0.1"]   # неверный список

  validation {
    condition = alltrue([
      for ip in var.ips :
      can(cidrhost("${ip}/32", 0)) && cidrhost("${ip}/32", 0) == ip
    ])
    error_message = "Все элементы списка должны быть корректными IPv4-адресами."
  }
}
*/