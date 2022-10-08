terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.22"
    }
  }
}

provider "digitalocean" {
  token = var.digital_ocean_token
}
