# Configure the AWS Provider
provider "aws" {
    region = "us-east-1"
    profile = "terraform"
}

# Almacenamiento
resource "aws_s3_bucket" "bucket-01" {
    bucket = "jelg-bucket-basico"
    tags = {
      Name = "jelg-bucket-basico"
      Enviroment = "qa"
    }
}
resource "aws_s3_bucket_acl" "bucket-01-acl" {
  bucket = aws_s3_bucket.bucket-01.id
  acl ="private"
}

# Servidores
resource "aws_instance" "servidor_web" {
  ami = "ami-00c39f71452c08778"
  instance_type = "t2.micro"
  tags = {
    Name = "servidor_web"
  }
}

resource "aws_instance" "servidor_bd" {
  ami = "ami-00c39f71452c08778"
  instance_type = "t2.micro"
  tags = {
    Name = "servidor_bd"
  }
}

resource "aws_instance" "servidor_backend" {
  ami = "ami-00c39f71452c08778"
  instance_type = "t2.micro"
  tags = {
    Name = "servidor_backend"
  }
}

# Colas
resource "aws_sqs_queue" "cola_basica" {
    name = "cola_basica"
    delay_seconds = 60
    max_message_size = 1024
    message_retention_seconds = 60000
    receive_wait_time_seconds = 10
    tags = {
        Enviroment = "lab"
    }
}

