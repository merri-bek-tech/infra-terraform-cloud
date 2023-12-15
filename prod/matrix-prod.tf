resource "digitalocean_droplet" "matrix-1" {
    image = "ubuntu-23-04-x64"
    name = "matrix-1"
    region = "syd1"
    size = "s-2vcpu-4gb"
    backups = true
    ssh_keys = [
      data.digitalocean_ssh_key.root.fingerprint
    ]
}

resource "digitalocean_reserved_ip" "matrix" {
  droplet_id = digitalocean_droplet.matrix-1.id
  region     = digitalocean_droplet.matrix-1.region
}

resource "digitalocean_record" "matrix" {
  domain = digitalocean_domain.chat.id
  type   = "A"
  name   = "@"
  value  = digitalocean_reserved_ip.matrix.ip_address
}

resource "digitalocean_record" "matrix-server" {
  domain = digitalocean_domain.chat.id
  type   = "A"
  name   = "matrix"
  value  = digitalocean_reserved_ip.matrix.ip_address
}

resource "digitalocean_record" "element-cname" {
  domain = digitalocean_domain.chat.id
  type   = "CNAME"
  name   = "element"
  value  = "matrix.merri-bek.chat."
}

resource "digitalocean_project_resources" "matrix-resources" {
  project = digitalocean_project.default.id
  resources = [
    digitalocean_droplet.matrix-1.urn
  ]
}
