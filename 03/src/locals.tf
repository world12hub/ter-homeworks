locals {
 
  env     = "develop"
  project = "netology"

  web_name     = "${local.project}-${local.env}-web"
  bastion_name = "${local.project}-${local.env}-bastion"
  db_name      = "${local.project}-${local.env}-db"
  storage_name = "${local.project}-${local.env}-storage"
}