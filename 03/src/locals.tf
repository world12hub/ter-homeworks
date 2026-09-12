locals {
 
  env     = "develop"
  project = "netology"

  web_name = "${local.project}-${local.env}-platform-web"
  bastion_name = "${local.project}-${local.env}-platform-bastion"
  db_name = "${local.project}-${local.env}-platform-db"
}