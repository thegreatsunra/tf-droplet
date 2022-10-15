locals {
  volume_name = "volume-${var.droplet_name}"

  ## digital ocean requires volume names use "-" but their mounted folder uses "_"
  volume_mount_path = replace("/mnt/${local.volume_name}", "-", "_")

  docker_volume_path = "${local.volume_mount_path}/${var.docker_volume_folder_name}"

  tmp_docker_volume_path = "/${var.tmp_folder_name}/${var.docker_volume_folder_name}"

  nginx_conf_vars = {
    domain_name = var.domain_name
  }

  docker_compose_vars = {
    domain_name        = var.domain_name
    email_address      = var.email_address
    docker_volume_path = local.docker_volume_path
  }

  user_data_vars = {
    docker_compose_base64   = base64encode(templatefile("./templates/docker-compose.yml.tftpl", local.docker_compose_vars))
    docker_volume_path      = local.docker_volume_path
    nginx_conf_base64 = base64encode(templatefile("./templates/nginx-conf/default.conf.tftpl", local.nginx_conf_vars))
    nginx_config_general_conf_base64 = base64encode(file("./templates/nginx-conf/modules/general.conf"))
    nginx_config_security_conf_base64 = base64encode(file("./templates/nginx-conf/modules/security.conf"))
    nginx_config_wordpress_conf_base64 = base64encode(file("./templates/nginx-conf/modules/wordpress.conf"))
    nginx_config_php_fastcgi_conf_base64 = base64encode(file("./templates/nginx-conf/modules/php_fastcgi.conf"))
    public_ssh_key          = var.public_ssh_key
    root_temporary_password = var.root_temporary_password
    tmp_docker_volume_path  = local.tmp_docker_volume_path
    tmp_folder_name         = var.tmp_folder_name
    user_full_name          = var.user_full_name
    user_temporary_password = var.user_temporary_password
    username                = var.username
    volume_mount_path       = local.volume_mount_path
    volume_name             = local.volume_name
    wordpress_dotenv_base64 = base64encode(file("./templates/.env"))
  }
}
