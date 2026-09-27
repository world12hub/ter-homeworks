resource "yandex_mdb_mysql_cluster" "this" {
  name        = var.name
  environment = var.environment
  network_id  = var.network_id
  version     = "8.0"

  resources {
    resource_preset_id = var.resource_preset_id
    disk_type_id       = "network-ssd"
    disk_size          = var.disk_size
  }

  host {
    zone      = var.zone
    subnet_id = var.subnet_id
  }

  access {
    web_sql = true
  }
}

resource "yandex_mdb_mysql_database" "this" {
  cluster_id = yandex_mdb_mysql_cluster.this.id
  name       = var.db_name
}

resource "yandex_mdb_mysql_user" "this" {
  cluster_id = yandex_mdb_mysql_cluster.this.id
  name       = var.db_user
  password   = var.db_password

  permission {
    database_name = yandex_mdb_mysql_database.this.name
  }
}