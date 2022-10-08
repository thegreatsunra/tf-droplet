locals {
  user_data_vars = {
    public_ssh_key = var.public_ssh_key
    username       = var.username
    user_full_name = var.user_full_name
  }
}
