resource "digitalocean_domain" "default" {
  name = "merri-bek.tech"
}

resource "digitalocean_domain" "chat" {
  name = "merri-bek.chat"
}

resource "digitalocean_project_resources" "domain-resources" {
  project = digitalocean_project.default.id
  resources = [
    digitalocean_domain.default.urn,
    digitalocean_domain.chat.urn
  ]
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

resource "digitalocean_record" "dkim1" {
  domain   = digitalocean_domain.default.id
  type     = "CNAME"
  name     = "fm1._domainkey"
  value    = "fm1.merri-bek.tech.dkim.fmhosted.com."
}

resource "digitalocean_record" "dkim2" {
  domain   = digitalocean_domain.default.id
  type     = "CNAME"
  name     = "fm2._domainkey"
  value    = "fm2.merri-bek.tech.dkim.fmhosted.com."
}

resource "digitalocean_record" "spf" {
  domain   = digitalocean_domain.default.id
  type     = "TXT"
  name     = "@"
  value    = "spf1 include:spf.messagingengine.com ?all"
}

resource "digitalocean_record" "ops-react-app" {
  domain   = digitalocean_domain.default.id
  type     = "CNAME"
  name     = "ops"
  value    = "merri-bek-tech.github.io."
}

resource "digitalocean_record" "parops-server" {
  domain   = digitalocean_domain.default.id
  type     = "CNAME"
  name     = "parops"
  value    = "parops-43jac.ondigitalocean.app."
}

resource "digitalocean_record" "parops-server-subdomain" {
  domain   = digitalocean_domain.default.id
  type     = "CNAME"
  name     = "*.parops"
  value    = "parops-43jac.ondigitalocean.app."
}