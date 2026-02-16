provider "postgresql" {
    host     = var.database_host
    port     = var.database_port
    username = var.database_admin_username
    password = var.database_admin_password
    sslmode = var.database_sslmode
}
