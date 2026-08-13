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
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_db_vpc_name" {
  type        = string
  default     = "db"
  description = "VPC network & subnet name"
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

variable "vm_db_platform_preemptible" {
  type        = bool
  default     = true
  description = "Прерываемая ВМ"
}
