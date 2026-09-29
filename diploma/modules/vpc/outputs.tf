output "vpc_id" {
  value = yandex_vpc_network.this.id
}

output "subnet_id" {
  value = yandex_vpc_subnet.this.id
}

output "subnet_cidr" {
  value       = var.v4_cidr_blocks[0]
  description = "CIDR подсети (для SG MySQL)"
}