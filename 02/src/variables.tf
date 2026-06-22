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
  default     = "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxAYlb6AJQE7AaUhrkgBo\nMfk5KFYzfyz4KbZEwsEaSxqxQnOornYbSA3Na2okhL9rrjVhOSy1enyslW4zPyQS\nlsp1/yGrqSW29Hhjg8uuis6OZjgsrW+EXgH87jD7NxOk3uaGC3En1BsVm6qknx25\nyqd4KmfdHKKZdLa/MORKlms2F3hA/wmjVL9/6yLcX9MxWa8FCI4bDkG/67bLv+d/\n10qmFFEgMJ8fSxV0QJpXkil5dW1Z56x2WPR0qpE+NdmP5e530HUbeA3r0ReGPrp5\nW6TCs2P1dQ0i2mYPzwNEKoU8bULb9j8mmrOOG+H+ILt2czp4BF4D4MNGlfJvleVx\nNQIDAQAB\n-----END PUBLIC KEY-----\n"
  description = "ssh-keygen -t ed25519"
}
