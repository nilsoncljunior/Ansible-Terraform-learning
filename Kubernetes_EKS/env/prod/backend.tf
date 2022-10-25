terraform {
  backend "s3" {
    bucket = "rwtsteste"
    key    = "prod/terraform.tf.state"
    region = "us-east-1"
    profile = "nilson"
  }
}
