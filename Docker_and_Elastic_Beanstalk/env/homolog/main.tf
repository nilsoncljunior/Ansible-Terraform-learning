module "homolog" {
  source = "../../infra"

  nome = "homolog"
  description = "aplication_homolog"
  max = 3
  instance = "t2.micro"
  ambiente = "homolog"
}