module "aws-prod" {
  source = "../../infra"
  instance = "t2.micro"
  region = "us-east-1"
  key = "key-prod"
  security_group = "prod-sg"
  tags = "prod sg"
  minimoasg = 1
  maximoasg = 3
  nameasg = "prod"
}

#output "public-IP-prod" {
#  value = module.aws-prod.public-IP
#}