data "cloudflare_zone" "zone" {
  for_each = local.container_loop.dns

  name = each.key
}

resource "cloudflare_record" "record" {
  for_each = local.container_loop.dns

  name    = each.value
  proxied = true
  type    = "A"
  value   = digitalocean_droplet.droplet.ipv4_address
  zone_id = data.cloudflare_zone.zone[each.key].id
}
