# bd
resource "yandex_compute_instance" "platform-db" {
  depends_on = [yandex_compute_instance.platform-bastion]
  for_each = { for vm in var.each_vm : vm.vm_name => vm }
  name        = "${local.db_name}-${each.value.vm_name}"
  platform_id = var.vm_web_platform_id
  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = each.value.disk_volume
      type     = "network-hdd"
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = false
  #  security_group_ids = [yandex_vpc_security_group.example.id]
  #  security_group_ids = count.index == 0 ? [yandex_vpc_security_group.example.id]: []
  }

metadata = var.metadata

}