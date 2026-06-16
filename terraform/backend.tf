terraform {

  backend "s3" {

    bucket = "ai-devopscloud-terraform-state"

    key = "eks/terraform.tfstate"

    region = "us-east-1"
  }
}
