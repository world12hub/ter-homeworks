###cloud vars

variable "vm_db_default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_db_vpc_name" {
  type        = string
  default     = "db"
  description = "VPC network & subnet name"
}

variable "vm_db_default_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_db_family_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "vm_db_family_image"
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
