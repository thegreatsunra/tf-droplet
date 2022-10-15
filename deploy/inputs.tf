variable "cloudflare_token" {
  type = string
}

variable "digital_ocean_token" {
  type = string
}

variable "droplet_image" {
  type    = string
  default = "debian-11-x64"
}

variable "droplet_name" {
  type = string
  validation {
    condition     = length(regexall("[^-a-z0-9]+", var.droplet_name)) == 0
    error_message = "Droplet name can only contain the following characters: a-z, 0-9, -"
  }
}

variable "droplet_region" {
  type    = string
  default = "nyc1"
}

variable "droplet_size" {
  type    = string
  default = "s-1vcpu-1gb"
}

variable "email_address" {
  type = string
}

variable "project" {
  type = string
}

variable "public_ssh_key" {
  type = string
}

variable "resource_tags" {
  type    = list(string)
  default = ["droplet"]
}

variable "root_temporary_password" {
  type    = string
  default = "temporary_password_change_me_immediately"
}

variable "tmp_folder_name" {
  type    = string
  default = "tmp_cloudinit"
  validation {
    condition     = length(regexall("[^-_a-z0-9]+", var.tmp_folder_name)) == 0 && var.tmp_folder_name != "tmp"
    error_message = "Folder name cannot be 'tmp' and can only contain the following characters: a-z, 0-9, -, _"
  }
}

variable "docker_volume_folder_name" {
  type    = string
  default = "docker_volume"
  validation {
    condition     = length(regexall("[^-_a-z0-9]+", var.docker_volume_folder_name)) == 0
    error_message = "Folder name can only contain the following characters: a-z, 0-9, -, _"
  }
}

variable "user_full_name" {
  type = string
}

variable "user_temporary_password" {
  type    = string
  default = "temporary_password_change_me_immediately"
}

variable "username" {
  type = string
}
