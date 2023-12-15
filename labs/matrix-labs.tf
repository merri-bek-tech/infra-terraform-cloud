resource "digitalocean_droplet" "labs-matrix-1" {
    image = "ubuntu-23-04-x64"
    name = "labs-matrix-1"
    region = "syd1"
    size = "s-2vcpu-4gb"
    backups = true
    ssh_keys = [
      data.digitalocean_ssh_key.root.fingerprint
    ]
}

resource "digitalocean_reserved_ip" "labs-matrix" {
  droplet_id = digitalocean_droplet.labs-matrix-1.id
  region     = digitalocean_droplet.labs-matrix-1.region
}

resource "digitalocean_record" "labs-matrix" {
  domain = digitalocean_domain.chat.id
  type   = "A"
  name   = "labs"
  value  = digitalocean_reserved_ip.labs-matrix.ip_address
}

resource "digitalocean_record" "labs-matrix-server" {
  domain = digitalocean_domain.chat.id
  type   = "A"
  name   = "matrix.labs"
  value  = digitalocean_reserved_ip.labs-matrix.ip_address
}

resource "digitalocean_record" "labs-element-cname" {
  domain = digitalocean_domain.chat.id
  type   = "CNAME"
  name   = "element.labs"
  value  = "matrix.labs.merri-bek.chat."
}

resource "digitalocean_project_resources" "labs-matrix-resources" {
  project = digitalocean_project.labs.id
  resources = [
    digitalocean_droplet.labs-matrix-1.urn
  ]
}
