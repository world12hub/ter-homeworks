output "cluster_id" {
  value       = yandex_mdb_mysql_cluster.this.id
  description = "ID кластера MySQL"
}

output "database_name" {
  value       = yandex_mdb_mysql_database.this.name
  description = "Имя созданной БД"
}

output "user_name" {
  value       = yandex_mdb_mysql_user.this.name
  description = "Имя созданного пользователя"
}

output "host_fqdn" {
  value       = yandex_mdb_mysql_cluster.this.host[0].fqdn
  description = "FQDN хоста MySQL"
}