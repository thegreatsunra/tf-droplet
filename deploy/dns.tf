data "cloudflare_zone" "zone" {
  name = var.cloudflare_zone
}

resource "cloudflare_record" "record" {
  name    = var.cloudflare_record_name
  proxied = true
  type    = "A"
  value   = digitalocean_droplet.droplet.ipv4_address
  zone_id = data.cloudflare_zone.zone.id
}
