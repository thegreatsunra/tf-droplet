resource "digitalocean_droplet" "droplet" {
  image      = var.droplet_image
  name       = var.droplet_name
  region     = var.droplet_region
  size       = var.droplet_size
  monitoring = true
  tags       = var.droplet_tags
  user_data  = templatefile("./templates/user_data.yml.tftpl", local.user_data_vars)
}
