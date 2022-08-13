module "aws-dev" {
  source = "../../infra"
  instance = "t2.micro"
  region = "us-east-1"
  key = "key-dev"
}

output "public-IP-dev" {
  value = module.aws-dev.public-IP
}