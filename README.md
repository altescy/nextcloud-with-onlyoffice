nextcloud-with-onlyoffice
=========================
Docker configs for nextcloud with onlyoffice.


### Installation

Fill the following values `[ ... ]` in `.env` file and run `make` command.

```
$ git clone https://github.com/altescy/nextcloud-with-onlyoffice
$ cd nextcloud-with-onlyoffice
$ cat << EOF > .env
POSTGRES_USER=[ postgresuser ]
POSTGRES_PASSWORD=[ postgrespassword ]

REDIS_HOST_PASSWORD=[ redispassword ]

NEXTCLOUD_VERSION=20.0
NEXTCLOUD_PORT=[ 8080 ]
NEXTCLOUD_ADMIN_USER=[ adminuser ]
NEXTCLOUD_ADMIN_PASSWORD=[ adminpassword ]
NEXTCLOUD_TRUSTED_DOMAINS=nginx [ nextcloud.example.com ]
EOF
$ make
$ make onlyoffice
```
