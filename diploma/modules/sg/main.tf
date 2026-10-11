terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.15.0"
}

resource "yandex_vpc_security_group" "this" {
  name       = var.sg_name
  network_id = var.network_id

  dynamic "ingress" {
    for_each = var.security_group_ingress
    content {
      protocol          = ingress.value.protocol
      description       = ingress.value.description
      port              = ingress.value.port
      from_port         = ingress.value.from_port
      to_port           = ingress.value.to_port
      v4_cidr_blocks    = ingress.value.v4_cidr_blocks
      security_group_id = ingress.value.security_group_id
    }
  }

  dynamic "egress" {
    for_each = var.security_group_egress
    content {
      protocol          = egress.value.protocol
      description       = egress.value.description
      port              = egress.value.port
      from_port         = egress.value.from_port
      to_port           = egress.value.to_port
      v4_cidr_blocks    = egress.value.v4_cidr_blocks
      security_group_id = egress.value.security_group_id
    }
  }
}
