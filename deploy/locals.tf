locals {
  nginx_conf_vars = {
    domain_name = var.domain_name
  }
  docker_compose_vars = {
    domain_name   = var.domain_name
    email_address = var.email_address
  }
  user_data_vars = {
    public_ssh_key          = var.public_ssh_key
    root_temporary_password = var.root_temporary_password
    user_full_name          = var.user_full_name
    user_temporary_password = var.user_temporary_password
    username                = var.username
    wordpress_dotenv_base64 = base64encode(file("./templates/.env"))
    nginx_conf_base64       = base64encode(templatefile("./templates/nginx.conf.tftpl", local.nginx_conf_vars))
    docker_compose_base64   = base64encode(templatefile("./templates/docker-compose.yml.tftpl", local.docker_compose_vars))
  }
}
