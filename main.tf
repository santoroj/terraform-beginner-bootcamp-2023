
terraform {
  required_providers {
    terratowns = {
      source  = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
}

provider "terratowns" {
  endpoint  = var.terratowns_endpoint
  user_uuid = var.teacherseat_uuid
  token     = var.terratowns_access_token
}


module "terrahouse_aws" {
  source              = "./modules/terrahouse_aws"
  user_uuid           = var.teacherseat_uuid
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  css_filepath        = var.css_filepath
  content_version     = var.content_version
  assets_path         = var.assets_path
}

resource "terratowns_home" "home" {
  name        = "Joes Cool Beers for 2023/24"
  description = <<-EOF
  Fanstic Gluten Free Beers.
  Better than ordinary beers.
EOF
  domain_name = module.terrahouse_aws.cloudfront_url
  #vdomain_name     = "d2n1h11ceu5m34.cloudfront.net"
  town            = "missingo"
  content_version = var.content_version
}
