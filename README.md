# WIP: Digital Ocean Droplet via Terraform

## TODO

- Build a Wordpress image `FROM` the official image [that includes the PHP plugins you need](https://github.com/docker-library/wordpress/blob/5bbbfa8909232af10ea3fea8b80302a6041a2d04/latest/php7.4/apache/Dockerfile#L18-L62)

## Usage

1. Generate and add your Digital Ocean and Cloudflare API tokens
1. Create `.env` files based on the `.env.example` files and update values

Then, deploy:

```shell
cd deploy
task tf-init tf-plan tf-apply
```

Wait until done, and then SSH into your server based on the outputted IP value from Terraform.

```shell
ssh <username>@<droplet_ip_address>
```

You'll be disconnected when the server finishes running the cloud-init scripts, but that's no reason not to start poking around to see if it all worked.

```shell
## check cloud-init logs
sudo cat /var/log/cloud-init-output.log

## WAIT UNTIL THE DROPLET REBOOTS BEFORE CONTINUING

## start the containers for the first time
cd wp_data
sudo docker compose up -d

## check status of containers
## nginx, wordpress, and mariadb should be running
## certbot will have run and quit
sudo docker ps

## see if certbot successfully validated your domain and mounted into the nginx container
## there should be a folder named after your domain in this folder
sudo docker compose exec nginx ls -la /etc/letsencrypt/live

## edit wp_data/docker-compose.yml and:
## remove --staging and replace with --force-renewal
## then, re-run certbot to really generate certs for your domain
sudo docker compose up --force-recreate --no-deps certbot

## replace nginx.conf with nginx.conf.https
mv nginx-conf/nginx.conf nginx-conf/nginx.conf.http && mv nginx-conf/nginx.conf.https nginx-conf/nginx.conf

## then force-recreate the containers
sudo docker compose up -d --force-recreate
```

## Tear it all down

```shell
task tf-destroy
```
