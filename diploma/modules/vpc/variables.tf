variable "folder_id" {
  type        = string
  default     = null
  description = "ID каталога; если null — берётся из провайдера"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}


variable "v4_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "Список CIDR-блоков подсети, https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Зона доступности, https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

