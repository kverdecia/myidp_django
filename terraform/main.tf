resource "random_password" "database_owner_password" {
    length = 16
    special = true
    override_special = "!@#$%&*()-_=+[]{}<>:?"
    keepers = {
        username = var.database_username
    }
}

resource "postgresql_role" "database_owner" {
    name = var.database_username
    login = true
    password = random_password.database_owner_password.result
}

resource "postgresql_database" "database" {
    name = var.database_dbname
    owner = postgresql_role.database_owner.name
}


locals {
    dotenv_path = var.dotenv_path == null ? "${path.root}/../.env" : var.dotenv_path
    dotenv_content = <<EOT

DATABASE_URL=postgres://${postgresql_role.database_owner.name}:${urlencode(random_password.database_owner_password.result)}@${var.database_host}:${var.database_port}/${postgresql_database.database.name}

ALLOWED_HOSTS=${var.allowed_hosts}
CSRF_TRUSTED_ORIGINS=${var.csrf_trusted_origins}

%{ if var.sentry_dsn != null }SENTRY_DSN=${var.sentry_dsn}%{ endif }
EOT
}

resource "local_file" "dotenv_config" {
    filename = local.dotenv_path
    content = local.dotenv_content
    count = var.create_dotenv ? 1 : 0
}
