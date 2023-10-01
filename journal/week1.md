# Terraform Begineer Bootcamp 2023 - Week 1

## Root Module Structure

Our root module structure is as follows:

```
PROJECT_ROOT
|
├── variables.tf - stores the structure of input variables
├── main.tf - everything else
├── providers.tf - defined required providers and their configuration
├── outputs.tf - stores our outputs
├── terraform.tfvars - the data of variables we want to load into our terraform project
├── README.md - Required for root modules
```



[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)
