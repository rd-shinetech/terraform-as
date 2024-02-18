provider "aws" {
  region = "us-east-1"
  profile = "TPG"
}

resource "aws_db_instance" "rds" {
  db_name = "myDB" // name of the database
  identifier = "my-first-rds" // name to identify the server hosting DB
  instance_class = "db.t2.micro"
  engine = "mariadb"
  engine_version = "10.2.21"
  # Secrets must be injected here... just keep it for now
  username = "bob"
  password = "password123"
  port = 3306
  allocated_storage = 20 // 20 Gigs
  # When destroying the snapshot (terraform destroy), go ahead and delete it
  skip_final_snapshot = true
}