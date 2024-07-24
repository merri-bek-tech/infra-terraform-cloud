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

// Mailing list setup, currently hosted externally by www.mailmanlists.net

resource "digitalocean_record" "lists-a" {
  domain   = digitalocean_domain.default.id
  type     = "A"
  name     = "lists"
  value    = "110.232.113.186"
}

resource "digitalocean_record" "lists-aaaa" {
  domain   = digitalocean_domain.default.id
  type     = "AAAA"
  name     = "lists"
  value    = "2404:9400:2:0:216:3eff:fee2:6ca9"
}

resource "digitalocean_record" "lists-mx" {
  domain   = digitalocean_domain.default.id
  type     = "MX"
  name     = "lists"
  priority = 10
  value    = "syd.mailmanlists.au."
}

resource "digitalocean_record" "lists-spf" {
  domain   = digitalocean_domain.default.id
  type     = "TXT"
  name     = "lists"
  value    = "v=spf1 a mx ip4:110.232.113.186 ip6:2404:9400:2:0:216:3eff:fee2:6ca9 ~all"
}

resource "digitalocean_record" "lists-dmarc" {
  domain   = digitalocean_domain.default.id
  type     = "TXT"
  name     = "_dmarc.lists"
  value    = "v=DMARC1; p=quarantine; pct=100; rua=mailto:dmarc@mailmanlists.net; ruf=mailto:dmarc@mailmanlists.net"
}

resource "digitalocean_record" "lists-dkim" {
  domain   = digitalocean_domain.default.id
  type     = "TXT"
  name     = "mail._domainkey.lists"
  value    = "v=DKIM1; h=sha256; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA3wfWRT1gstUolkpZwbCRC66AZBH0IgKpJCKzpWiWIPrX+zEJVLyb3VCar+lO4SZL7W8W6fh20gs0ol3qh+ESoQ52PJMLYymIiVyDsQkmB0qV3mtWT+jqetK8BZoP4DlWlJHN/jA9vJIN5HX3cHyzinV7aSgxRdzHxP1uKuZpNlxnZGaI1QxuD/3qy+jmw++DJcbi7zZX6li+6s"
}

// Apps

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