provider "aws" {
  region = "us-east-1"
  profile = "TPG"
}

# Variables to login to HashiCorp Vault
variable "username" {
  type = string
}

variable "password" {
  type = string
}

# Declares the HashiCorp Vault as provider
provider "vault" {
  auth_login {
    path = auth / userpass / login / var.username
    parameters = {
      password = var.password
    }
  }
}

# Fetches data from HashiCorp Vault
data "vault_generic_secret" "dbuser" {
  path = "secret/dbuser"
}

# Fetches data from HashiCorp Vault
data "vault_generic_secret" "dbpassword" {
    path = "secret/dbpassword"    
}

# Create AWS RDS instance using credentials from HashiCorp Vault
resource "aws_db_instance" "my_rds" {
  identifier = "my-first-rds"
  instance_class = "db.t2.micro"
  engine = "mariadb"
  engine_version = "10.2.21"
  username = data.vault_generic_secret.dbuser.data["value"]
  password = data.vault_generic_secret.dbpassword.data["value"]
  port = 3306
  allocated_storage = 20
  skip_final_snapshot = true
}