variable "database_host" {
    description = "database host"
    type        = string
}

variable "database_port" {
    description = "database port"
    type        = number
}

variable "database_sslmode" {
    description = "database sslmode"
    type        = string
}

variable "database_admin_username" {
    description = "database admin username"
    type        = string
}

variable "database_admin_password" {
    description = "database admin password"
    type        = string
    sensitive   = true
}

variable "database_username" {
    description = "database username"
    type        = string
    default     = "project-bridge"
}

variable "database_dbname" {
    description = "database name"
    type        = string
    default     = "project-bridge"
}

variable "dotenv_path" {
    description = "path of the dotenv file to generate"
    type        = string
    default     = null
}

variable "allowed_hosts" {
    description = "Allowed hosts for the Django application"
    type        = string
    default     = "127.0.0.1 10.0.2.2 0.0.0.0 project-bridge.local project-bridge-django"
}

variable "csrf_trusted_origins" {
    description = "CSRF trusted origins for the Django application"
    type        = string
    default     = "http://127.0.0.1 http://10.0.2.2 http://0.0.0.0 https://project-bridge.local https://project-bridge-django"
}

variable "sentry_dsn" {
    description = "Sentry DSN for error tracking"
    type        = string
    default     = null
}

variable "create_dotenv" {
    description = "Whether to create the dotenv file"
    type        = bool
    default     = true
}