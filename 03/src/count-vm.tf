data "yandex_compute_image" "ubuntu" {
  family = var.family_image
}

# web
resource "yandex_compute_instance" "platform" {
  count = var.instance_count
  name        = "local.web_name-${count.index + 1}"
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
  #  security_group_ids = [yandex_vpc_security_group.example.id]
    security_group_ids = count.index == 0 ? [yandex_vpc_security_group.example.id]: []
  }

metadata = var.metadata

}