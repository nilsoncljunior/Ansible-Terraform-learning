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
  region  = var.region
}

resource "aws_instance" "app_server" {
  ami           = "ami-0729e439b6769d6ab"
  instance_type = var.instance
  key_name = var.key
  tags = {
    Name = "ExampleB"
  }
}  

resource "aws_key_pair" "keySSH" {
  key_name = var.key
  public_key = file("${var.key}.pub")
}

output "public-IP" {
  value = aws_instance.app_server.public_ip
}