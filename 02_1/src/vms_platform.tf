###cloud vars

variable "vm_db_default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "name_vm_db"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "vm_db_platform_id"
}

variable "vm_db_cores" {
  type        = string
  default     = "2"
  description = "vm_db_cores"
}

variable "vm_db_memory" {
  type        = string
  default     = "2"
  description = "vm_db_memory"
}

variable "vm_db_core_fraction" {
  type        = string
  default     = "20"
  description = "vm_db_core_fraction"
}
###ssh vars

variable "vm_db_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIrOJSguOlh1E0lRQYa2/ROW1inyi8N/AOFBzab30jcJ adminks@vmaltp11"
  description = "ssh-keygen -t id_ed25519"
}
