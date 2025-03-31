data "digitalocean_ssh_key" "root" {
  name = "id-merri-bek-root"
}

data "digitalocean_ssh_key" "jade-admin" {
  name = "jade-admin"
}