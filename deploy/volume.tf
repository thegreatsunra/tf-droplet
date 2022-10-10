resource "digitalocean_volume" "volume" {
  region                  = var.droplet_region
  name                    = "volume-${var.droplet_name}"
  size                    = 4
  initial_filesystem_type = "ext4"
  tags                    = var.resource_tags
}

resource "digitalocean_volume_attachment" "foobar" {
  droplet_id = digitalocean_droplet.droplet.id
  volume_id  = digitalocean_volume.volume.id
}
