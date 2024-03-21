#!/bin/sh

/app/import-meta-env-linux -x /app/.env.example.public -p /usr/local/apache2/htdocs/index.html || exit 1

httpd-foreground