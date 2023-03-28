# Configure the AWS Provider
provider "aws" {
    region = "us-east-1"
    profile = "aws-icesi-2023-nube"
}

resource "aws_instance" "servidor_clase_7" {
  ami = "ami-00c39f71452c08778"
  instance_type = "t2.micro"

  tags = {
    Name = "servidor_clase_7-aws"
  }
}

resource "aws_instance" "servidor_clase_7_ubuntu" {
  ami = "ami-0557a15b87f6559cf"
  instance_type = "t2.micro"

  tags = {
    Name = "servidor_clase_7_ubuntu"
  }
}