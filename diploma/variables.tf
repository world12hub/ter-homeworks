variable "cloud_id" {
  type        = string
  description = "ID облака Yandex Cloud"
}

variable "folder_id" {
  type        = string
  description = "ID каталога Yandex Cloud"
}

variable "zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Зона доступности"

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


variable "username" {
  type        = string
  description = "Имя пользователя в ВМ"
  default     = "ubuntu"
}

variable "db_password" {
  type        = string
  sensitive   = true
}

variable "ssh_public_key" {
  type    = string
  description = "ssh public key"

  validation {
    condition     = var.ssh_public_key == null || can(regex("^ssh-(rsa|ed25519|dss) ", var.ssh_public_key))
    error_message = "ssh_public_key должен быть null или валидным SSH-ключом (ssh-rsa / ssh-ed25519 / ssh-dss)."
  }  
}
