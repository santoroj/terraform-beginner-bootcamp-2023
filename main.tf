
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
  content_version     = var.content_version
  assets_path         = var.assets_path
}

resource "terratowns_home" "home" {
  name        = "How to play Arcanum in 2023"
  description = <<-EOF
    Arcanum is a game from 2001 that is shipped with a lot of bugs
    Modders have removed all the originals making this game really
    fun to play ( despite that old look graphics).  This is my guid that will
    show you how to play arcanum without spoiling the plot.
EOF
  domain_name = module.terrahouse_aws.cloudfront_url
  #vdomain_name     = "d2n1h11ceu5m34.cloudfront.net"
  town            = "missingo"
  content_version = 1
}
