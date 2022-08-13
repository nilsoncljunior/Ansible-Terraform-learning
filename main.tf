terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  profile = "nilson"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0729e439b6769d6ab"
  instance_type = "t2.micro"
  key_name = "key"

  tags = {
    Name = "ExampleA"
  }
}  