variable "dbname" {
  type = string
}

resource "aws_instance" "db" {
  ami = "ami-0e731c8a588258d0d"
  instance_type = "t2.micro"

  tags = {
    Name = var.dbname
  }
}