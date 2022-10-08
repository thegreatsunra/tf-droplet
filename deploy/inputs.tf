variable "digital_ocean_token" {
  type = string
}

variable "droplet_image" {
  type    = string
  default = "debian-11-x64"
}

variable "droplet_name" {
  type = string
}

variable "droplet_region" {
  type    = string
  default = "nyc1"
}

variable "droplet_size" {
  type    = string
  default = "s-1vcpu-1gb"
}

variable "droplet_tags" {
  type    = list(any)
  default = ["droplet"]
}

