terraform {
  backend "s3" {
    bucket = "terra-state-aco999"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}
