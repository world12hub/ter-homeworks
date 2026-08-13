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

variable "vpc_name_develop" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
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

variable "vm_platform_preemptible" {
  type        = bool
  default     = true
  description = "Прерываемая ВМ"
}


variable "vms_resources" {
  description = "Конфигурации ресурсов для каждой ВМ"
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {}
}

variable "metadata" {
  description = "Общие метаданные для всех виртуальных машин"
  type        = map(string)
  default     = {}
}