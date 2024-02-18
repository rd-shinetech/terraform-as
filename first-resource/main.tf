# Variables
variable "vpc_name" {
  type = string
  default = "myvpc"
}

variable "ssh_port" {
  type = number
  default = 22
}

variable "enabled" {
  type = bool
  default = false
}

variable "mylist" {
  type = list(string)
  default = [ "value1", "value2" ]
}

variable "mymap" {
  type = map
  default = {
    key1 = "value1"
    key2 = "value2"
  }
}

variable "input_name" {
  type = string
  description = "Set the name of the VPC"
}

# Provider
# AWS plugin for Terraform
provider "aws" {
  region = "us-east-1"
  profile = "TPG"
}

# Resources
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.input_name
  }
}

# Tuple
# Tuples work with multiple data types 
variable "my_tuple" {
  type = tuple([string, number, string])
  default = [ "cat", 1, "dog" ]
}

# Object
# Variable to store objects (complex types)
variable "my_object" {
  type = object({name = string, port = list(number)})
  default = {
    name = "Rodrigo"
    port = [ 22, 25, 80 ]
  }
}

# Output
output "vpc_id" {
  description = "VPC ID"
  value = aws_vpc.myvpc.id
}

output "my_object_output" {
  description = "Object Output"
  value = var.my_object
}