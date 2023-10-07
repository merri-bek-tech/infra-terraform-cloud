resource "digitalocean_ssh_key" "jade" {
  name       = "Jade's Public Key"
  public_key = file("./public_keys/id_merri_bek_jade.pub")
}
