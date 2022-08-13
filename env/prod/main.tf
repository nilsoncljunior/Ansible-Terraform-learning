module "aws-prod" {
  source = "../../infra"
  instance = "t2.micro"
  region = "us-east-1"
  key = "key-prod"
  security_group = "default-sg-prod"
  tags = "prod sg"
  description = "prod sg"

}

output "public-IP-prod" {
  value = module.aws-prod.public-IP
}