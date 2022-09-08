module "prod" {
  source = "../../infra"

  nome = "prod"
  description = "aplication_prod"
  max = 3
  instance = "t2.micro"
  ambiente = "prod"
}