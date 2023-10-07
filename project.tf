resource "digitalocean_project" "merri-bek-tech" {
  name        = "merri-bek-tech"
  description = "Merri-bek Tech's live production hosting project."
  purpose     = "Web Application"
  environment = "Production"
  resources   = [
    digitalocean_droplet.wiki-1.urn,
    digitalocean_domain.default.urn
  ]
}
