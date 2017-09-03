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
-subj "/C=UK/O=IndexFeed/OU=DevOps Dept. /CN=nexus.cards.idx.zone"
```

```
openssl req -x509 -nodes -days 365 \
-newkey rsa:2048 \
-keyout nginx-selfsigned.key \
-out nginx-selfsigned.crt \
-subj "/C=UK/O=IndexFeed/OU=DevOps Dept. /CN=nexus.cards.idx.zone"
```

* `req`
* `-509`
* `-nodes`
* `-days 365`
* `-newkey`
* `-out`
* `-subj`


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


# Steps

```
vagrant up
vagrant ssh
```

Now inside the vagrant VM
```
cd /vagrant
sudo ./bin/setup-env.sh
docker-compose up -d
```

Containers should be started

## On Host machine update `/etc/hosts` file with vagrant IP

```
# Prints vagrant IP
vagrant ssh -c "hostname -I | cut -d' ' -f2" 2>/dev/null
```

### /etc/hosts

The file should look something like this:
```
##
# Host Database
#
# localhost is used to configure the loopback interface
# when the system is booting.  Do not change this entry.
##
127.0.0.1	localhost
255.255.255.255	broadcasthost
::1             localhost

192.168.1.110 nexus.cards.idx.zone
```

## On Web Brower configure Docker Repository

1. log onto nexus: https://nexus.cards.idx.zone
  - __Username:__ admin
  - __Password:__ admin123
