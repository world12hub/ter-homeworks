variable "folder_id" {
  type        = string
  default     = null
  description = "ID каталога; если null — берётся из провайдера"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"

    validation {
    condition     = length(var.vpc_name) > 0 && length(var.vpc_name) <= 63
    error_message = "Имя должно быть непустым и не длиннее 63 символов."
  }
}


variable "v4_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "Список CIDR-блоков подсети, https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
  
  validation {
    condition     = length(var.v4_cidr_blocks) > 0
    error_message = "Нужно указать хотя бы один CIDR-блок."
  }

  validation {
    condition     = alltrue([for c in var.v4_cidr_blocks : can(cidrhost(c, 0))])
    error_message = "Каждый элемент должен быть валидным CIDR, например 10.0.1.0/24."
  }

  validation {
    condition     = alltrue([for c in var.v4_cidr_blocks : can(regex("^\\d{1,3}(\\.\\d{1,3}){3}/\\d{1,2}$", c))])
    error_message = "CIDR должен быть в формате IPv4 a.b.c.d/nn, например 10.0.1.0/24."
  }
}

variable "zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Зона доступности, https://cloud.yandex.ru/docs/overview/concepts/geo-scope"

  validation {
    condition = contains([
      "ru-central1-a",
      "ru-central1-b",
      "ru-central1-d",
      "ru-central1-e",
    ], var.zone)
    error_message = "Зона должна быть одной из: ru-central1-a, ru-central1-b, ru-central1-d, ru-central1-e."
  }
}

