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

#resource "aws_instance" "app_server" {
#  ami           = "ami-0729e439b6769d6ab"
#  instance_type = var.instance
#  key_name = var.key
#  tags = {
#    Name = "ExampleB"
#  }
#}

resource "aws_launch_template" "maquina" {
  image_id = "ami-0729e439b6769d6ab"
  instance_type = var.instance
  key_name = var.key
  tags = {
    Name = "launch template"
  }
  security_group_names = [ var.security_group ]
  user_data = filebase64("ansible.sh")
}

resource "aws_key_pair" "keySSH" {
  key_name = var.key
  public_key = file("${var.key}.pub")
}

#output "public-IP" {
#  value = aws_instance.app_server.public_ip
#}

resource "aws_autoscaling_group" "grupoasg" {
  availability_zones = [ "${var.region}a", "${var.region}b"  ]
  name = var.nameasg
  max_size = var.maximoasg
  min_size = var.minimoasg
  launch_template {
    id = aws_launch_template.maquina.id
    version = "$Latest"
  }
  target_group_arns = [ aws_lb_target_group.targetlb.arn ]
}

resource "aws_default_subnet" "subnet_1" {
  availability_zone = "${var.region}a"
}  

resource "aws_default_subnet" "subnet_2" {
  availability_zone = "${var.region}b"  
}

resource "aws_lb" "Loadbalancer" {
  internal = false
  subnets = [ aws_default_subnet.subnet_1.id, aws_default_subnet.subnet_2.id ]
}

resource "aws_lb_target_group" "targetlb" {
  name = "maquinasAlvo"
  port = "8000"
  protocol = "HTTP"
  vpc_id = aws_default_vpc.redepadrao.id
}

resource "aws_default_vpc" "redepadrao" {  
}

resource "aws_lb_listener" "entradaLB" {
  load_balancer_arn = aws_lb.Loadbalancer.arn
  port = "8000"
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.targetlb.arn
  }
}