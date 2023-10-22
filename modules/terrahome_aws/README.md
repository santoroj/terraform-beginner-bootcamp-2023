## Terrahome AWS

The following directory

```tf
module "home_beer" {
  source              = "./modules/terrahome_aws"
  user_uuid           = var.teacherseat_uuid
  public_path         = var.beer_public_path
  content_version     = var.content_version
}
```

The public directory expects the following: 
  - index.html
  - error.html
  - styles.css
  - assets

All top level files in assets will be copied, but not any subdirectories 

