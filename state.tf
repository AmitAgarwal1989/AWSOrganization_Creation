terraform {
  backend "s3" {
        bucket = "network-prod-e1-terraformstate"
        encrypt = true
        key = "aws_orga/terraform.tfstate"
        region = "us-east-1"
  }
}