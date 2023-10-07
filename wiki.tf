resource "digitalocean_droplet" "wiki-1" {
    image = "ubuntu-23-04-x64"
    name = "wiki-1"
    region = "syd1"
    size = "s-1vcpu-512mb-10gb"
    # ssh_keys = [
    #   data.digitalocean_ssh_key.terraform.id
    # ]
}

resource "digitalocean_reserved_ip" "wiki" {
  region = "syd1"
}

resource "digitalocean_reserved_ip_assignment" "example" {
  ip_address = digitalocean_reserved_ip.wiki.ip_address
  droplet_id = digitalocean_droplet.wiki-1.id
}

resource "digitalocean_record" "wiki" {
  domain = digitalocean_domain.default.id
  type   = "A"
  name   = "wiki"
  value  = digitalocean_reserved_ip.wiki.ip_address
}
