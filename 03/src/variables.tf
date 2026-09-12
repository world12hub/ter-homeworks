###cloud vars
# variable "token" {
#   type        = string
#   description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
# }

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
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
  description = "VPC network&subnet name"
}

variable "family_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "family_image"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "vm_web_platform_id"
}

variable "vm_bastion_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "vm_web_platform_id"
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

variable "each_vm" {
  type = list(object({
    vm_name=string
    cpu=number
    ram=number
    disk_volume=number
    core_fraction=number
  }))
}


###ssh vars

variable "metadata" {
  description = "Общие метаданные для всех виртуальных машин"
  type        = map(string)
  default     = {}
}


# count loop
variable "instance_count" {
  default = 2
  type    = number
}

variable "env" {
  type    = string
  default = "production" #создавать ли бастион
}

variable "external_acess_bastion" {
  type    = bool
  default = true #false true создавать ли бастион
}