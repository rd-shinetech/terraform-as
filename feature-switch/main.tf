provider "aws" {
  region = "us-east-1"
  profile = "TPG"
}

variable "environment" {
  type = string
}

resource "aws_instance" "ec2" {
  ami = "ami-0e731c8a588258d0d"
  instance_type = "t2.micro"
  count = var.environment == "prod" ? 1 : 0
}



