provider "aws" {
  region = "us-east-1"
  profile = "TPG"
}

resource "aws_instance" "ec2" {
  ami = "ami-0e731c8a588258d0d"
  instance_type = var.instance_type
}