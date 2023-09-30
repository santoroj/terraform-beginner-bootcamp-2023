
terraform {

  cloud {
    organization = "terraform-beginner-bootcamp-2023"

    workspaces {
      name = "terra-house-1"
    }
  }

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "random" {
  # Configuration options
}


# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string#lower
resource "random_string" "bucket_name" {
  length  = 32
  special = false
  lower   = true
  upper   = false
}


resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result

  tags = {
    Name        = "My Test Bucket"
    Environment = "Terraform-Bootcamp"
  }
}

output "random_bucket_name_result" {
  value = random_string.bucket_name.result
}
