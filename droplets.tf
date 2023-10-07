resource "digitalocean_droplet" "wiki-1" {
    image = "ubuntu-23-04-x64"
    name = "wiki-1"
    region = "syd1"
    size = "s-1vcpu-512mb-10gb"
    # ssh_keys = [
    #   data.digitalocean_ssh_key.terraform.id
    # ]
}
