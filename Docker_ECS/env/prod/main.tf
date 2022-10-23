module "prod" {
    source = "../../infra"
    nome_ecr = "teste_curso"
    cargoIAM = "prod"
    ambiente = "prod"
}

output "IP_alb" {
  value = module.prod.IP
}