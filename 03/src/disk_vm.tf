resource "yandex_compute_disk" "disk" {
  count = 3
  name  = "disk-${count.index + 1}"
  type  = "network-hdd"
  zone  = var.default_zone
  size  = var.storage_disk_size
}

resource "yandex_compute_instance" "storage" {
  name        = local.storage_name
  hostname    = local.storage_name
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.vms_resources["web"].cores
    memory        = var.vms_resources["web"].memory
    core_fraction = var.vms_resources["web"].core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

metadata = var.metadata

}
