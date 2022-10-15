data "cloudflare_zone" "zone" {
  name = local.sites_available_list[0].cloudflare_zone
}

resource "cloudflare_record" "record" {
  name    = local.sites_available_list[0].cloudflare_record_name
  proxied = true
  type    = "A"
  value   = digitalocean_droplet.droplet.ipv4_address
  zone_id = data.cloudflare_zone.zone.id
}
