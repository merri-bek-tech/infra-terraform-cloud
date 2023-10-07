resource "digitalocean_domain" "default" {
  name = "merri-bek.tech"
}

# Email setup. Currently directing mail to Fastmail
# @todo: Merri-bek tech needs it's own email setup

resource "digitalocean_record" "mx1" {
  domain   = digitalocean_domain.default.id
  type     = "MX"
  name     = "@"
  priority = 10
  value    = "in1-smtp.messagingengine.com."
}

resource "digitalocean_record" "mx2" {
  domain   = digitalocean_domain.default.id
  type     = "MX"
  name     = "@"
  priority = 20
  value    = "in2-smtp.messagingengine.com."
}
