# cloud-terraform

Provision cloud infrastructure used by Merri-bek Tech

# Pre-requisites

## Your development machine

1. Install Terraform
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

2. Get issued a Digital Ocean Personal Access Token (PAT)
Log into Digital Ocean's web interface and follow [these steps](https://docs.digitalocean.com/reference/api/create-personal-access-token/).

## Your Digital Ocean account

Merri-bek tech already has a digital ocean account setup. If you're setting this up for your own org, perform the following steps.

* Create a personal account on digital ocean
* Create a team, and setup billing details
* Set the team to require two-factor auth (optional, but very sensible)
* Create a new public/private keypair, with a passphrase. Store the passphrase securely in a password manager. Upload the public key to digital ocean, and name it `id-merri-bek-root`

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
