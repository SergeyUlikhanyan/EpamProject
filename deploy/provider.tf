# Providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
  #access_key  = "xxxxxx"
  #secret_key  = "yyyyyy"
}
