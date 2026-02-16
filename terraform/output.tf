output "database_host" {
    value = var.database_host
}

output "database_port" {
    value = var.database_port
}

output "database_name" {
    value = postgresql_database.database.name
}

output "database_username" {
    value = postgresql_role.database_owner.name
}

output "database_password" {
    value = random_password.database_owner_password.result
    sensitive = true
}
