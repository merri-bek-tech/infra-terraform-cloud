resource "digitalocean_project" "default" {
  name        = "merri-bek-tech"
  description = "Merri-bek Tech's live production hosting project."
  purpose     = "Web Application"
  environment = "Production"
}
