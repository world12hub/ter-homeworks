# web
resource "yandex_compute_instance" "web" {
  depends_on  = [yandex_compute_instance.db]
  count       = var.instance_count
  name        = "${local.web_name}-${count.index + 1}"
  hostname    = "${local.web_name}-${count.index + 1}"
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.vms_resources["storage"].cores
    memory        = var.vms_resources["storage"].memory
    core_fraction = var.vms_resources["storage"].core_fraction
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
    nat       = false
  #  security_group_ids = [yandex_vpc_security_group.example.id]
    security_group_ids = count.index == 0 ? [yandex_vpc_security_group.example.id]: []
  }

metadata = var.metadata

}