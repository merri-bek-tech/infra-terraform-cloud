resource "digitalocean_droplet" "websites-1" {
    image = "ubuntu-23-04-x64"
    name = "websites-1"
    region = "syd1"
    size = "s-1vcpu-512mb-10gb"
    backups = true
    ssh_keys = [
      data.digitalocean_ssh_key.root.fingerprint
    ]
}

resource "digitalocean_reserved_ip" "websites" {
  droplet_id = digitalocean_droplet.websites-1.id
  region     = digitalocean_droplet.websites-1.region
}

resource "digitalocean_record" "www" {
  domain = digitalocean_domain.default.id
  type   = "CNAME"
  name   = "www"
  value  = "merri-bek-tech.github.io."
}

resource "digitalocean_record" "base-1" {
  domain = digitalocean_domain.default.id
  type   = "A"
  name   = "@"
  value  = "185.199.108.153"
}

resource "digitalocean_record" "base-2" {
  domain = digitalocean_domain.default.id
  type   = "A"
  name   = "@"
  value  = "185.199.109.153"
}

resource "digitalocean_record" "base-3" {
  domain = digitalocean_domain.default.id
  type   = "A"
  name   = "@"
  value  = "185.199.110.153"
}

resource "digitalocean_record" "base-4" {
  domain = digitalocean_domain.default.id
  type   = "A"
  name   = "@"
  value  = "185.199.111.153"
}

resource "digitalocean_record" "websites" {
  domain = digitalocean_domain.default.id
  type   = "A"
  name   = "websites"
  value  = digitalocean_reserved_ip.websites.ip_address
}

resource "digitalocean_project_resources" "websites-resources" {
  project = digitalocean_project.default.id
  resources = [
    digitalocean_droplet.websites-1.urn
  ]
}

