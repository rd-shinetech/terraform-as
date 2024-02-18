provider "aws" {
  region = "us-east-1"
  profile = "TPG"
}

variable "ingress_rules" {
  type = list(number)
  default = [ 25, 80, 443, 8080, 8443 ]
}

variable "egress_rules" {
  type = list(number)
  default = [ 443, 8443 ]
}

resource "aws_instance" "ec2-db" {
  ami = "ami-01a6e31ac994bbc09"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.web-traffic.name]
  tags = {
    Name = "Web Server"
  }
}

# Illustrates the dynamic block usage
resource "aws_security_group" "web-traffic" {
  name = "Secure Web Server"
  dynamic "ingress" {
    iterator = port 
    for_each = var.ingress_rules
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egress_rules
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}