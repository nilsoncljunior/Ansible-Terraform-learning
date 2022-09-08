terraform {
  backend "s3" {
    bucket = "rwtsteste"
    key    = "homolog/terraform.tfstate"
    region = "us-east-1"
  }
}
