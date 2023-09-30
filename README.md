# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:


This project is going to utilize  semantic versioning for it's tagging.
[semver.org](https://semver.org/)

Given a version number **MAJOR.MINOR.PATCH**, increment the:

The general format:

**MAJOR.MINOR.PATCH**, eg. 1.0.1

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes


## Installation Notes:

Note users must have some knowledge of the Linux CLI


### Considerations with the Terraform CLI changes
The terraform CLI installation instructions have changed due to the gpg keyring changes.  So we need to refer to the latest install CLI instructions via Terraform Documentation and change the scriptings for install.

[Install Terraform CLI ](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

The terraform bash script is located here: ([./bin/install_terraform_cli](./bin/install_terraform_cli))


## Gitpod 

[gitpod workspaces](https://www.gitpod.io/docs/config/workspaces/tasks)

 - This will keep Gitpod Task File tidy. ([.gitpod.yml](.gitpod.yml))
 - Easier to debug

We need to be careful when using the Init in `.gitpod.yml` as it will not rerun if we restart an existing workspace.


### Considerations for Linux Distribution

Thie project is built against Ubuntu
Please consider checking your Linux Distruction and change accordingly to distrubtion needs.


## Refactoring into Bash Scripts


 ### Script Shebang
 - Standard Linux/Unix Option for Shebanging a script file.
 - Better script portability

### Checking Linux Version run the following command

Example of checking the version using the cat command

```bash

$ cat /etc/os-release

PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```


### File Permissions
 - Use Standard Linux/Unix commands for changing file permission


### Working with Env Vars

We can list out all Environment Variables ( Env Vars ) using the `env` command

We can filter specific env vars using grep eg. `env | grep AWS_`

### Setting and Unsetting Env Vars

In the termainal we can set using `export HELLO='worlds`

In the terminal we uset using `unset HELLO`

We can set an env var temporarily when just running a command

```bash
HELLO='world' . /bin/print_message
```

Within a bash script we can set an env var without writing export eg.

``` bash
#!/usr/bin/env bash

HELLO='world'
echo $HELLO
```

#### Printing Vars

We can print an env var using echo eg. `echo $HELLO`

#### Scopig of Env Vars

When you open up new bash terminals in VSCode it will not be aware of env vars that you have set in another window.

If you want ot Env Vars to persist across all future bash terminals that are open you need to set env vars in your bash profile.
eg. `/home/USERNAME/.bash_profile`

#### Persisting Env in Gitpod

We can persist env vars into gitpod by storing them in Gitpod Secrets Storage.

```
gp env HELLO='world'
```

All future workspace launched will set the env vars for all bash terminals opened in thoses workspaces.

You can also set env vars in the `.gitpod.yml` but this can only contain non-sensitive env vars.


### AWS CLU Installation

AWS CLI is install for this project via the bash script [`./bin/install_aws_cli`](./bin/install_aws_cli)

[Getting started with instll of AWS CLI]("https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip")

[Example information of setting the env vars within aws ](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our AWS credentials are configured correctly by running the following AWS CLI command:

```sh
aws sts get-caller-identity
```

if successful you should see a json payload return that looks something like this:

```json
{
    "UserId": "MYADSW123456AMPLE",
    "Account": "123456789012",
    "Arn": "arn:aws:iam::123456789012:user/terraform-beginner-bootcamp"
}
```

## Terraform Basics

### Terraform Registry
Terraform source their providers and modules from the Terraform registry which is located at [terraform.io](https://registry.terraform.io/)

- **Providers** is an interface to APIS that will allow you to create resources in terraform
- **Modules**  are a way to make large amounts of terraform code modular, portable and sharable.

[Random Terrafor Provider](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)

#### Terraform Console
We can see a list of all the terraform commands by simply typing `terraform`


#### Terraform Init
`terraform apply`
At the start of the a new terraform project we will run `terraform init` to download the binariers for the terraform providers used by the project.

#### Terraform Plan
`terraform plan`
This will generate out a changeset , about the state of our infracture and what will be changed.

We can output this change set ie "plan" to be passed o an apply, but often you can just ignore outputting.

####  Terraform Apply
`terraform apply`
This will run a plan and pass the changeset to  be executed by terraform.  Apply should prompt yes or no.

If we want to automatically approve an apply we can provide the auto approve flag eg `terraform apply --auto-approve`

#### Terraform Destroy
`terraform destroy`

This will destroy resources.
You can also use the auto-approve flag to skup the approve prompt

eg. `terraform destroy --auto-approve`


#### Terraform Lock Files
`.terraform.lock.hcl` contains the locked versioning for the providers or modules that should be used with this project.

The Terraform Lock File **should be committed** to your version Control System (VSC)  eg. Github

#### Terraform State Files
`terraform.tfstate` contaains information about the current state of your infrastructure.

This file **should not be committed** to your VCS

This file can contain sensitive data.

If you lose this file, you lose knowing the state of your infrastuctor 

`.terraform.tfstate.backup` is the previous state file.

#### Terraform Directory
`.terraform` directory contains binaries of terraform providers.

