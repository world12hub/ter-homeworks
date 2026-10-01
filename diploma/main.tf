module "vpc" {
  source = "./modules/vpc"

  vpc_name       = "main-network"
  zone           = var.zone
  v4_cidr_blocks = ["10.0.1.0/24"]
}

module "web_sg" {
  source = "./modules/sg"

  sg_name    = "web-sg"
  network_id = module.vpc.vpc_id

  security_group_ingress = [
    {
      protocol       = "TCP"
      description    = "SSH"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = 22
    },
    {
      protocol       = "TCP"
      description    = "HTTP"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = 80
    },
    {
      protocol       = "TCP"
      description    = "HTTPS"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = 443
    },
  ]
}

# security_group_egress не указан — используется default (ANY → 0.0.0.0/0)

module "web_vm" {
  source         = "./modules/vm"
  env_name       = "dev"
  instance_name  = "web"
  instance_count = 1
  
  subnet_zones   = [var.zone]
  subnet_ids     = [module.vpc.subnet_id]

  image_family   = "ubuntu-2004-lts"
  public_ip      = true
  platform       = "standard-v3"
  instance_cores = 2
  instance_memory = 2
  instance_core_fraction = 20
  boot_disk_type         = "network-hdd"
  boot_disk_size         = 10

  security_group_ids = [module.web_sg.sg_id]


  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 0
  }

  labels = { 
    owner= "s-kanyugin",
    project = "devops"
     }
  description = "Web VM for learning project"
  
}



module "mysql_sg" {
  source = "./modules/sg"

  sg_name    = "mysql-sg"
  network_id = module.vpc.vpc_id

  security_group_ingress = [
    {
      protocol       = "TCP"
      description    = "MySQL from web subnet"
      v4_cidr_blocks = [module.vpc.subnet_cidr]
      port           = 6432
    },
  ]
}


module "mysql" {
  source = "./modules/mysql"

  name               = "mysql-cluster"
  network_id         = module.vpc.vpc_id
  subnet_id          = module.vpc.subnet_id
  zone               = var.zone
  environment        = "PRESTABLE"
  resource_preset_id = "b1.medium"
  disk_type_id       = "network-hdd"
  disk_size          = 10
  db_password        = var.db_password

  security_group_ids = [module.mysql_sg.sg_id]
}

module "container_registry" {
  source = "./modules/container_registry"

  name = "app-registry"
}


data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    username       = var.username
    ssh_public_key = var.ssh_public_key
  }
}

