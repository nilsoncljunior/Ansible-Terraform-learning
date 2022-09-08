terraform {
  backend "s3" {
    bucket = "rwtsteste"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
    profile = "nilson"
  }
}
