###cloud vars


variable "cloud_id" {
  type        = string
  default     = "b1gcehnmg326hj1svui2"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1g133inh4mh0get24ds"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMXAuAo0E6Kf3HkjszOlEgODfI09LnH634CySKPytGig adminks@vmaltp11"
  description = "ssh-keygen -t ed25519"
}

# OS

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Образ ОС"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Образ ОС"
}

variable "vm_platform_cores" {
  description = "Количество vCPU"
  type        = number
  default     = 2
  description = "Количество vCPU"
}

variable "vm_platform_memory" {
  type        = number
  default     = 1
  description = "Объем RAM в ГБ"
}

variable "vm_platform_core_fraction" {
  type        = number
  default     = 20
  description = "Гарантированная доля vCPU"
}

variable "vm_platform_preemptible" {
  type        = bool
  default     = true
  description = "Прерываемая ВМ"
}
