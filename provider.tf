# Configure the AWS Provider
provider "aws" {
  region      = "eu-central-1"
  profile     = "default"
}


# Terraform Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


