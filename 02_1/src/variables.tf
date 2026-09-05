###cloud vars


variable "cloud_id" {
  type        = string
  default     = "b1gcehnmg326hj1svui2"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1g3dfkpec58ip0g77d6"
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

variable "family_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "family_image"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "name_yandex_compute_instance"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "vm_web_platform_id"
}

variable "vm_web_cores" {
  type        = string
  default     = "2"
  description = "vm_web_cores"
}

variable "vm_web_memory" {
  type        = string
  default     = "1"
  description = "vm_web_memory"
}

variable "vm_web_core_fraction" {
  type        = string
  default     = "20"
  description = "vm_web_core_fraction"
}
###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIrOJSguOlh1E0lRQYa2/ROW1inyi8N/AOFBzab30jcJ adminks@vmaltp11"
  description = "ssh-keygen -t id_ed25519"
}
