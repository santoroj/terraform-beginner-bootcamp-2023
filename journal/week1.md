# Terraform Begineer Bootcamp 2023 - Week 1

## Fixing Tags

[How to Delete Local and Remote Tags on git](https://devconnected.com/how-to-delete-local-and-remote-tags-on-git/)

local delete a tag

```sh
git tag -d <tag_name>
```

Remotely delete a tag

```sh
git push --delete origin tagname
```

Checkout the commit that you want to retag. Grab the sh from yout Github history.

```sh
git checout <SHA>
git tag M.M.P
git put --tags
git checkout main
```

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

## Terraform and Input Variables

## Terraform Cloud Variables

In terraform we can set two kinds of variables:

- Environment Variables - those you would set in your bash terminal eg. AWS credentials
- Terraform Variables - those that you would normally set in your tfvars file

We can set Terraform Cloud varibles to be sensistive so they are not show visibly in the UI.

## Loading Terraform Varibles

[Terraform input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

### var flag

We can use the `-var` flag to set an input variable or override a variable in the tfvars file
eg .`terraform -var user_uuid="my-user-id"`

### var-file flag

- TODO: doument this flag

### terraform.tfvars

This is the defailt file to load in teraform variables in bluk

### auto.tfvars

- TODO: document this functionality for terraform cloud

### order of terraform variables

- TODO: document which terraform variables takes presendence

## Dealing with Configuration Drift

`terraform state list`
aws_s3_bucket.website_bucket

Next check the state of the resource/bucket

`terraform state show aws_s3_bucket.website_bucket`

Output from the previous command :-

```sh
# aws_s3_bucket.website_bucket:
resource "aws_s3_bucket" "website_bucket" {
    arn                         = "arn:aws:s3:::phl2l3j34dtcz5a9ij8cb8cf0m3zjcu3"
    bucket                      = "phl2l3j34dtcz5a9ij8cb8cf0m3zjcu3"
    bucket_domain_name          = "phl2l3j34dtcz5a9ij8cb8cf0m3zjcu3.s3.amazonaws.com"
    bucket_regional_domain_name = "phl2l3j34dtcz5a9ij8cb8cf0m3zjcu3.s3.eu-west-2.amazonaws.com"
    force_destroy               = false
    hosted_zone_id              = "Z3GKZC51ZF0DB4"
    id                          = "phl2l3j34dtcz5a9ij8cb8cf0m3zjcu3"
    object_lock_enabled         = false
    region                      = "eu-west-2"
    request_payer               = "BucketOwner"
    tags                        = {
        "Environment" = "Terraform-Bootcamp"
        "UserUuid"    = "c9c9fdfc-6080-11ee-99a3-e3f5d76f44e8"
    }
    tags_all                    = {
        "Environment" = "Terraform-Bootcamp"
        "UserUuid"    = "c9c9fdfc-6080-11ee-99a3-e3f5d76f44e8"
    }

    grant {
        id          = "7c099a2b47599c5e75de34d6b6a96fec72094933a9ad1edd911578037e7ba55"
        permissions = [
            "FULL_CONTROL",
        ]
        type        = "CanonicalUser"
    }

    server_side_encryption_configuration {
        rule {
            bucket_key_enabled = false

            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }

    versioning {
        enabled    = false
        mfa_delete = false
    }
}
```

Now run the terraform command
`terraform import aws_s3_bucket.website_bucket phl2l3j34dtcz5a9ij8cb8cf0m3zjcu3`

## What happens if we lose our state file ?

If you lose your statefile, you will likely have to tear down all your cloud infrastructure manually.

You can use terraform import but it won't for all cloud resources. You need to check the terraform providers documentation for which resources support import.

### Fix Missing Resources with Terraform Import

[Terraform Import](https://developer.hashicorp.com/terraform/cli/import)

### Fix Manual Configuration

If someone goes and deletes or modifies cloud resources manually through ClickOps.

If we run Terraform plan it will attempt to our infrastructure back into the expected state fixing Configuration Drift

## Fix using Terraform Refresh

```sh
terraform apply --refresh-only -auto-approve
```

## Terraform Modules

### Terraform Module Structure

It is recommend to place modules in a `modules` directory when locally developing modules but you can name it whatever you like

### Passing Inut Variables

We can pass input variables to our module

The module has to declare the terraform variables in it's own variables.tf

```sh
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}

```

### Modules Sources

Using the source we can import the module from the various places eg:

- locally
- github
- terraform registry

[Module Sources ](https://developer.hashicorp.com/teraform/language/modules/sources)

## Considerations when using ChatGPT to write Terraform

LLMs such as ChatGPT may not be trained on the latest documentation or information about Terraform.

It may likely product older examples that could be deprecated. Often afffecting providers.

## Working with Files in Terraform

### Files Exist Function

This is a built int terraform function

```sh
condition = can(file(var.index_html_filepath))
```

### Filemd5

[filemd5 details](https://developer.hashicorp.com/terraform/language/functions/filemd5)

### Filexists

[fileexits detail](https://developer.hashicorp.com/terraform/language/functions/fileexists)

### Path Variable

In Terraform mthere is a special variable called `path` that allows us to reference local paths:

- path.module = get the path for the current module
- path.root = get the path for the root of the project

[Special Path Variable](https://developer.hashicorp.com/terraform/language/expressions/references#filesystem-and-workspace-info)

```sh
resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = var.index_html_filepath
  etag = filemd5(var.index_html_filepath)
}
```

## Terraform Locals

Locals allows us to define local variables.
It can be very useful when we need to transform data into another formatand have it referenced as a variable

```sh
locals {
  s3_origin_id = "MyS3Origin"
}
```

[Local Values](https://developer.hashicorp.com/terraform/language/values/locals)

### Terraform Data Sources

This allows us to source data from cloud resources.

This is useful when we want to reference cloud resources without importing them.

```sh
data "aws_caller_identity" "current" {}
    output "account_id" {
        value = data.aws_caller_identity.current.account_id
    }
}
```

[Terraform Data Sources](https://developer.hashicorp.com/terraform/language/data-sources)

## Working with JSON

we use the jsonencode to create the json policy inline in the hcl.

```sh
    jsonencode({"hello"="world"})
    {"hello":"world"}
```

[jsoncode](ttps://developer.hashicorp.com/terraform/language/functions/jsonencode)

### Changing the Lifecycle of Resources

[Meta Arguments Lifecycle](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle)

## Terraform data

Plain data values such as Local Values and Input Variables don't have any side-effects to plan against and so they aren't valid in replace_triggered_by. You can use terraform_data's behavior of planning an action each time input changes to indirectly use a plain value to trigger replacement.

[Terraform Data](https://developer.hashicorp.com/terraform/language/data-sources)

## Provisioners

Provisioners allow you to execute commands on compute instances eg. aw AWS CLI commnand.

They are not recommended for use by Hashicorp because Configuration Management tools such as Ansible are a better fit, but the functionality exits.

[Provisioners](https://developer.hashicorp.com/terraform/language/resources/provisioners/syntax)

## Local-exec

[Local Exec](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec)

This will execute commands on the machine running the terraform commands eg. plan, apply

```sh
resource "aws_instance" "web" {
  # ...

  provisioner "local-exec" {
    command = "echo The server's IP address is ${self.private_ip}"
  }
}

```

## Remote-exec

[Remote Exec](https://developer.hashicorp.com/terraform/language/resources/provisioners/remote-exec)

This will execute commands on a machine which you target. You will need to provide credentials such as ssh to get into the machine.

```sh
resource "aws_instance" "web" {
  # ...

  # Establishes connection to be used by all
  # generic remote provisioners (i.e. file/remote-exec)
  connection {
    type     = "ssh"
    user     = "root"
    password = var.root_password
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "puppet apply",
      "consul join ${aws_instance.web.private_ip}",
    ]
  }
}

```

## for Each Expression

[or Each Expressions](https://developer.hashicorp.com/terraform/language/expressions/for)

For each allows us to enumberate over complex data types

```sh
[ for s in var.list : upper(s)]
```

This is mostly useful when you are creating multiple of a cloud resource and you want to reduce the amount or repetitive terraform code.

https://developer.hashicorp.com/terraform/language/functions/list

### Example

> fileset("${path.root}/public/assets", "\*.{jpg,png,gif}")
> toset([
> "arcanum.jpg",
> "arcanum03.jpg",
> ])
