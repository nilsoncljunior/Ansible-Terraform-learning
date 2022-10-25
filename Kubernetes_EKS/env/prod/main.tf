module "prod" {
    source = "../../infra"
    nome_ecr = "teste_curso"
    cargoIAM = "prod"
    ambiente = "prod"
    cluster_name = "prod"
}

# output "DNS" {
#   value = module.prod.URL
# }