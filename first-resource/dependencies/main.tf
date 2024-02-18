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

  depends_on = [ aws_instance.db ]
}

resource "aws_instance" "db" {
  ami = "ami-0e731c8a588258d0d"
  instance_type = "t2.micro"

  tags = {
    Name = "DB Server"
  }
}

# Datasources enable you to query AWS for infrastructure information
# Make an AWS API query call to find out some details
data "aws_instance" "dbsearch" {
  filter {
    name = "tag:Name"
    values = ["DB Server"]
  }
}

output "DB_Server_ARNs" {
  value = data.aws_instance.dbsearch.arn
}

output "DB_Server_AZs" {
  value = data.aws_instance.dbsearch.availability_zone
}