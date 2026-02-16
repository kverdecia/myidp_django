
terraform {
    required_version = ">=1.1"
    required_providers {
        random = {
            source = "hashicorp/random"
            version = "3.8.0"
        }
        postgresql = {
            source = "cyrilgdn/postgresql"
            version = "1.26.0"
        }
        local = {
            source = "hashicorp/local"
            version = "2.6.1"
        }
    }
}
