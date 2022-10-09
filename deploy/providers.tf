terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.22"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.25"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_token
}

provider "digitalocean" {
  token = var.digital_ocean_token
}
