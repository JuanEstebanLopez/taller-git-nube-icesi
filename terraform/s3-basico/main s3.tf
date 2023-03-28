# Configure the AWS Provider
provider "aws" {
    region = "us-east-1"
    profile = "aws-icesi-2023-nube"
}

resource "aws_s3_bucket" "bucket-01" {
    bucket = "jelg-bucket-202302"
    tags = {
      Name = "jelg-bucket-202302"
      Enviroment = "qa"
    }
}

resource "aws_s3_bucket_acl" "bucket-01-acl" {
  bucket = aws_s3_bucket.bucket-01.id
  acl ="private"
}

