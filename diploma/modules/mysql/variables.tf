variable "name" {
  type        = string
  description = "Имя кластера MySQL"
}

variable "network_id" {
  type        = string
  description = "ID сети"
}

variable "subnet_id" {
  type        = string
  description = "ID подсети"
}

variable "zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Зона доступности"
}

variable "environment" {
  type        = string
  default     = "PRESTABLE"
  description = "Окружение кластера (PRESTABLE/PRODUCTION)"
}

variable "disk_size" {
  type        = number
  default     = 10
  description = "Размер диска в ГБ"
}

variable "resource_preset_id" {
  type        = string
  default     = "b1.medium"
  description = "Пресет ресурсов"
}

variable "disk_type_id" {
  type        = string
  default     = "network-hdd"
  description = "Тип диска: network-hdd / network-ssd / network-ssd-nonreplicated"

  validation {
    condition     = contains(["network-hdd", "network-ssd", "network-ssd-nonreplicated"], var.disk_type_id)
    error_message = "disk_type_id должен быть одним из: network-hdd, network-ssd, network-ssd-nonreplicated."
  }
}

variable "db_name" {
  type        = string
  default     = "appdb"
  description = "Имя базы данных"
}

variable "db_user" {
  type        = string
  default     = "appuser"
  description = "Имя пользователя БД"
}

variable "db_password" {
  type        = string
  sensitive   = true
  description = "Пароль пользователя БД"
}