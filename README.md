# Digital Ocean Droplet + WordPress/MariaDB/Nginx in Docker + Certbot TLS + Cloudflare DNS 

> Together at last

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
cd ~/docker && sudo docker compose up -d

## check status of containers
## nginx, wordpress, and mariadb should be running
## certbot will have run and quit
sudo docker ps

## see if certbot successfully validated your domain and mounted into the nginx container
## there should be a folder named after your domain in this folder
sudo docker compose exec nginx ls -la /etc/letsencrypt/live

## edit ~/docker/docker-compose.yml and:
## remove --staging and replace with --force-renewal
## then, re-run certbot to really generate certs for your domain
sudo docker compose up --force-recreate -d --no-deps certbot

## then, comment out the HTTP stuff and un-comment the HTTPS stuff in nginx default.conf

## then restart the containers
sudo docker compose restart -d
```

## Tear it all down

```shell
task tf-destroy
```

## License

The MIT License (MIT)

Copyright (c) 2022 Dane Petersen
