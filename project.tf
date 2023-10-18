resource "digitalocean_project" "default" {
  name        = "merri-bek-tech-prod"
  description = "Merri-bek Tech's live production hosting project."
  purpose     = "Web Application"
  environment = "Production"
}

resource "digitalocean_project" "labs" {
  name        = "merri-bek-tech-labs"
  description = "Merri-bek Tech's labs hosting project."
  purpose     = "Web Application"
  environment = "Staging"
}