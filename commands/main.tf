provider "aws" {
  region  = "us-east-1"
  profile = "TPG"
}

resource "aws_vpc" "myvpc" {
  tags = {"name": "myvpc"}
  cidr_block = "10.0.0.0/16"
}

resource "aws_vpc" "myvpc2" {
  cidr_block = "10.0.0.0/16"
}
