module "aws-dev" {
  source = "../../infra"
  instance = "t2.micro"
  region = "us-east-1"
  key = "key-dev"
  security_group = "dev-sg"
  tags = "dev sg"
  minimoasg = 0
  maximoasg = 1
  nameasg = "dev"
}

output "public-IP-dev" {
  value = module.aws-dev.public-IP
}