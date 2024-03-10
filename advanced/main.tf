provider "aws" {
  region = "us-east-1"
  profile = "TPG"
}

variable "VPC_NAME" {
  type = string
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.VPC_NAME
  }
}

