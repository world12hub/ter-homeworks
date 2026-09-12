locals {
 
  env     = "develop"
  project = "netology"

  web_name = "${local.project}-${local.env}-platform-web"
}