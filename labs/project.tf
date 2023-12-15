resource "digitalocean_project" "labs" {
  name        = "merri-bek-tech-labs"
  description = "Merri-bek Tech's labs hosting project."
  purpose     = "Web Application"
  environment = "Staging"
}