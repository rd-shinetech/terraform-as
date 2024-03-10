provider "aws" {
  region = "us-east-1"
  profile = "TPG"
}

resource "aws_instance" "myec2" {
  ami = "ami-0e731c8a588258d0d"
  instance_type = "t2.micro"

  tags = {
    Name = "Web server"
  }
}

module "dbserver" {
  source = "./db/mysql"
  # passing parameter for the module (expected dbname variable)
  dbname = "mydbserver"
}

output "dbprivateip" {
  value = module.dbserver.privateip
}