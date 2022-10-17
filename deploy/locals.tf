locals {

  wp_loop_vars = {
    wp_containers = {
      "wp_blog" = "blog.thegreatsunra.net"
    }
    email_address = "thegreatsunra@gmail.com"
  }

  sites_available_list = jsondecode(file("./sites-available.json"))

  user_data_vars = {
    docker_compose_base64 = base64encode(templatefile("./docker/docker-compose.yml.tftpl", local.wp_loop_vars))
    nginx_conf_base64                  = base64encode(templatefile("./docker/nginx/conf.d/default.conf.tftpl", local.wp_loop_vars))
    nginx_config_php_conf_base64                  = base64encode(templatefile("./docker/nginx/conf.d/modules/php.conf.tftpl", local.wp_loop_vars))
    nginx_config_general_conf_base64   = base64encode(file("./docker/nginx/conf.d/modules/general.conf"))
    nginx_config_security_conf_base64  = base64encode(file("./docker/nginx/conf.d/modules/security.conf"))
    nginx_config_wordpress_conf_base64 = base64encode(file("./docker/nginx/conf.d/modules/wordpress.conf"))
    nginx_dockerfile                   = base64encode(file("./docker/nginx/Dockerfile"))
    public_ssh_key                     = var.public_ssh_key
    root_temporary_password            = var.root_temporary_password
    tmp_folder                         = local.tmp_folder
    user_full_name                     = var.user_full_name
    user_temporary_password            = var.user_temporary_password
    username                           = var.username
    wordpress_dotenv_base64            = base64encode(file("./docker/.env"))
  }
}
