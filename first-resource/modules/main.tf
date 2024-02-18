provider "aws" {
  region = "us-east-1"
  profile = "TPG"
}

resource "aws_instance" "web" {
  ami = "ami-0e731c8a588258d0d"
  instance_type = "t2.micro"

  tags = {
    Name = "Web Server"
  }
}

module "dbserver" {
  source = "./db"
}