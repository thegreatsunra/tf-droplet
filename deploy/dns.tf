data "cloudflare_zone" "zone" {
  name = var.cloudflare_zone
}

resource "cloudflare_record" "record" {
  zone_id = data.cloudflare_zone.zone.id
  name    = var.cloudflare_record_name
  value   = digitalocean_droplet.droplet.ipv4_address
  type    = "A"
  proxied = true
}
