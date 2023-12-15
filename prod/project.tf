resource "digitalocean_project" "default" {
  name        = "merri-bek-tech-prod"
  description = "Merri-bek Tech's live production hosting project."
  purpose     = "Web Application"
  environment = "Production"
}
