locals {
 
  env     = "develop"
  zone    =  "ru-central1"
  subnet_name_develop_a = "${local.env}-${local.zone}-a"
  subnet_name_develop_b  = "${local.env}-${local.zone}-b"
}