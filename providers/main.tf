# AWS plugin uses AWS API
provider "aws" {
  region = "us-east-1"
  profile = "TPG"
}

# Vault plugin uses Valt API
//provider "vault" {
//}

# Another AWS provider in Sydney 
#provider "aws" {
#  region = "ap-southeast-2"
#  alias = "sydney"
#}

resource "aws_vpc" "my-vpc" {
  provider = aws // default, not needed
  cidr_block = "10.0.0.0/16"
}

#resource "aws_vpc" "sydney-vpc" {
#  provider = aws.sydney // provider is AWS in Sydney region
#  cidr_block = "10.0.0.0/16"
#}