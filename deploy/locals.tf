locals {
  user_data_vars = {
    public_ssh_key          = var.public_ssh_key
    root_temporary_password = var.root_temporary_password
    user_full_name          = var.user_full_name
    user_temporary_password = var.user_temporary_password
    username                = var.username
  }
}
