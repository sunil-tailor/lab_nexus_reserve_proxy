# Lab - Nexus Docker Repository with Nginx Reverse Proxy



## Pre-Setup Instructions

1. Create Self-signed certifications
1. Run `docker-compose up -d`


* __C__: _Country_ code in our case its UK
* __ST__: _State_, Greater London
* __L__: _City_, London
* __O__: Organisation
* __OU__: Organisation Unit i.e. Dept.
* __CN__: _Common Name_ its important this is the server name.

We can format the details of the Cert. into one string and automate the creation of the Self-signed certificate.

```
-subj "/C=UK/ST=Greater London/L=London/O=IndexFeed/OU=DevOps Dept. /CN=nexus.cards.idx.zone/emailAddress=sunil.tailor@lloydsbanking.com"
```

```
openssl req -x509 -nodes -days 365 \
-newkey rsa:2048 \
-keyout nginx-selfsigned.key \
-out nginx-selfsigned.crt \
-subj "/C=UK/ST=Greater London/L=London/O=IndexFeed/OU=DevOps Dept. /CN=nexus.cards.idx.zone/emailAddress=sunil.tailor@lloydsbanking.com"
```


## How to clean up docker

###### Remove containers
```
docker-compose stop
docker-compose rm
```
###### Remove Network & volume

```
docker network ls
docker network rm nginx-net

docker volume ls
docker volume rm nexus-data
```

Or alternatively you could `prune` the environment with:

```
docker network prune
docker volume prune
```
