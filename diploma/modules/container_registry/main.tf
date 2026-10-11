terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 1.15.0"
}


resource "yandex_container_registry" "this" {
  name = var.name
}