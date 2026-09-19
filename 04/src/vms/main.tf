# #создаем облачную сеть
# resource "yandex_vpc_network" "develop" {
#   name = var.vpc_name
# }

# #создаем подсеть
# resource "yandex_vpc_subnet" "develop_a" {
#   name           = local.subnet_name_develop_a
#   zone           = var.zone-a
#   network_id     = yandex_vpc_network.develop.id
#   v4_cidr_blocks = var.cidr_develop_a
# }

# resource "yandex_vpc_subnet" "develop_b" {
#   name           = local.subnet_name_develop_b
#   zone           = var.zone-b
#   network_id     = yandex_vpc_network.develop.id
#   v4_cidr_blocks = var.cidr_develop_b
# }

module "vpc" {
  source = "./modules/vpc"

  vpc_name   = "develop"
  zone           = "ru-central1-a"
  v4_cidr_blocks = ["10.0.1.0/24"]
}

output "vpc_dev_subnet" {
  value = module.vpc.subnet
}

module "test-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "develop" 
  network_id     = module.vpc.network.id
  subnet_zones   = ["ru-central1-a"]
  subnet_ids     = [module.vpc.subnet.id] 
  instance_name  = "webs"
  instance_count = 2
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { 
    owner= "s.kanyugin",
    project = "marketing"
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

module "example-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "stage"
  network_id     = module.vpc.network.id  
  subnet_zones   = ["ru-central1-a"]
  subnet_ids     = [module.vpc.subnet.id] 
  instance_name  = "web-stage"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { 
      owner= "s.kanyugin",
      project = "analytics"
      }
  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    username       = var.username
    ssh_public_key = var.ssh_public_key
  }
}

