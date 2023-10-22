
terraform {
  required_providers {
    terratowns = {
      source  = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }

  # backend "remote" {
  # hostname = "app.terraform.io"
  # organization = "Exampro"
#

# workspaces {
#   name = "terra-house-1"
# }

  cloud {
    organization = "terraform-beginner-bootcamp-2023"
    workspaces {
      name = "terra-house-1"
    }
  }
}

provider "terratowns" {
  endpoint  = var.terratowns_endpoint
  user_uuid = var.teacherseat_uuid
  token     = var.terratowns_access_token
}

###############################################################################
module "home_beer_hosting" {
  source              = "./modules/terrahome_aws"
  user_uuid           = var.teacherseat_uuid
  public_path         = var.beer.public_path
  content_version     = var.beer.content_version
}

resource "terratowns_home" "home_beer" {
  name        = "Joes Cool Beers for 2023/24"
  description = <<-EOF
  Fanstic Gluten Free Beers.
  Better than ordinary beers.
EOF
  domain_name = module.home_beer_hosting.domain_name
  #vdomain_name     = "d2n1h11ceu5m34.cloudfront.net"
  town            = "cooker-cove"
  content_version = var.beer.content_version
}

###############################################################################

module "home_payday_hosting" {
  source              = "./modules/terrahome_aws"
  user_uuid           = var.teacherseat_uuid
  public_path         = var.payday.public_path
  content_version     = var.payday.content_version
}

resource "terratowns_home" "home_payday" {
  name        = "Making your own Payday Bar"
  description = <<-EOF
  Since I really like payday bars I decided to see if I could make my own payday bars
EOF
  domain_name = module.home_payday_hosting.domain_name
  #vdomain_name     = "d2n1h11ceu5m34.cloudfront.net"
  town            = "missingo"
  content_version = var.payday.content_version
}