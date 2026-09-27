output "vm_ids" {
  value       = yandex_compute_instance.vm[*].id
  description = "ID всех созданных ВМ"
}

output "external_ip_address" {
  value = yandex_compute_instance.vm.*.network_interface.0.nat_ip_address
  description = "Публичные IP-адреса всех ВМ"
}

output "internal_ip_address" {
  value = yandex_compute_instance.vm.*.network_interface.0.ip_address
  description = "Внутренние IP-адреса всех ВМ"
}

output "fqdn" {
  value = yandex_compute_instance.vm.*.fqdn
  description = "FQDN всех созданных ВМ"
}

output "labels" {
  value = yandex_compute_instance.vm.*.labels
  description = "Метки всех ВМ"
}

#output "network_interface" {
#  value = yandex_compute_instance.vm.*.network_interface
#}

#output "all" {
#  value = yandex_compute_instance.vm
#}