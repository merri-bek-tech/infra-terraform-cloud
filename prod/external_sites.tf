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
