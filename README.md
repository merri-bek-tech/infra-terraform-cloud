# cloud-terraform

Provision cloud infrastructure used by Merri-bek Tech

# Pre-requisites

1. Install Terraform
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

2. Get issued a Digital Ocean Personal Access Token (PAT)
Log into Digital Ocean's web interface and follow [these steps](https://docs.digitalocean.com/reference/api/create-personal-access-token/).

# Run

## Dry run

You can see the steps that Terraform will apply by running.

`terraform plan -var "do_token=${DO_PAT}"`
Assumes that you have put your digital ocean PAT into an environment variable called DO_PAT.

## Live (wet) run

To apply the changes, use:

`terraform apply -var "do_token=${DO_PAT}"`

When prompted to confirm, type `yes`.

# Learning

This article describes using terraform with Digital Ocean
https://www.digitalocean.com/community/tutorials/how-to-use-terraform-with-digitalocean
