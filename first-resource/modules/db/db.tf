resource "aws_instance" "db" {
  for_each = {
    for key in toset(["dev", "test", "prod"]) : key => key
  }
  ami = "ami-0e731c8a588258d0d"
  instance_type = "t2.micro"

  tags = {
    Name = "DB Server ${each.key}"
  }
}