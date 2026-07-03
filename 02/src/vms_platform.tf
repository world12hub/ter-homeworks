###cloud vars


variable "vm_db_cloud_id" {
  type        = string
  default     = "b1gcehnmg326hj1svui2"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "vm_db_folder_id" {
  type        = string
  default     = "b1g133inh4mh0get24ds"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "vm_db_default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "vm_db_default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_db_vpc_name" {
  type        = string
  default     = "db"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vm_db_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMXAuAo0E6Kf3HkjszOlEgODfI09LnH634CySKPytGig adminks@vmaltp11"
  description = "ssh-keygen -t ed25519"
}

# OS

variable "vm_db_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Образ ОС"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Образ ОС"
}

variable "vm_db_platform_cores" {
  type        = number
  default     = 2
  description = "Количество vCPU"
}

variable "vm_db_platform_memory" {
  type        = number
  default     = 2
  description = "Объем RAM в ГБ"
}

variable "vm_db_platform_core_fraction" {
  type        = number
  default     = 20
  description = "Гарантированная доля vCPU"
}

variable "vm_db_platform_preemptible" {
  type        = bool
  default     = true
  description = "Прерываемая ВМ"
}
