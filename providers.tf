terraform {

  # cloud {
  #   organization = "terraform-beginner-bootcamp-2023"

  #   workspaces {
  #     name = "terra-house-1"
  #   }
  # }

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.16.2"
    }
  }
}


provider "aws" {
  # Configuration options
}
