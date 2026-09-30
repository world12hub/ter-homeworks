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

variable "environment" {
  type        = string
  default     = "PRESTABLE"
  description = "Окружение кластера (PRESTABLE/PRODUCTION)"

  validation {
    condition     = contains(["PRESTABLE", "PRODUCTION"], var.environment)
    error_message = "environment должен быть PRESTABLE или PRODUCTION."
  }

}

variable "disk_size" {
  type        = number
  default     = 10
  description = "Размер диска в ГБ"

  validation {
    condition     = var.disk_size >= 10 && var.disk_size <= 4096
    error_message = "disk_size должен быть в диапазоне 10..4096 ГБ."
  }  
}

variable "resource_preset_id" {
  type        = string
  default     = "b1.medium"
  description = "Пресет ресурсов"

  validation {
    condition = contains([
      "b1.medium",
      "b2.medium",
      "s2.micro",
      "s2.small",
      "s2.medium",
      "m2.small",
      "m2.medium",
    ], var.resource_preset_id)
    error_message = "resource_preset_id должен быть одним из поддерживаемых классов: b1.medium, b2.medium, s2.micro, s2.small, s2.medium, m2.small, m2.medium."
  }  
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

  validation {
    condition     = can(regex("^[a-z][a-z0-9_]*$", var.db_name))
    error_message = "db_name должен начинаться со строчной буквы и содержать только строчные буквы, цифры и подчёркивание."
  }
}

variable "db_user" {
  type        = string
  default     = "appuser"
  description = "Имя пользователя БД"

  validation {
    condition     = can(regex("^[a-z][a-z0-9_]*$", var.db_user))
    error_message = "db_user должен начинаться со строчной буквы и содержать только строчные буквы, цифры и подчёркивание."
  }  
}

variable "db_password" {
  type        = string
  sensitive   = true
  description = "Пароль пользователя БД"

  validation {
    condition     = length(var.db_password) >= 8 && length(var.db_password) <= 128
    error_message = "Пароль должен быть от 8 до 128 символов."
  }
}

variable "security_group_ids" {
  type        = list(string)
  default     = []
  description = "Список ID групп безопасности для кластера MySQL"
}

variable "db_user_roles" {
  type        = list(string)
  default     = ["ALL"]
  description = "Роли пользователя БД"
}