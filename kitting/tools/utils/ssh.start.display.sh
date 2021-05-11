#!/bin/bash

touch ~/motd.custom

# header
cat <<EOD >> ~/motd.custom
##########################################
  ############ KITTING LIST ############
##########################################
EOD

# common
cat <<EOD >> ~/motd.custom
### common node help
npm run help

EOD

# nginx
cat <<EOD >> ~/motd.custom
### nginx
help     : sudo nginx -h
check    : sudo nginx -t
reload   : sudo nginx -s reload
setting  : sudo vi /etc/nginx/conf.d

EOD

# certbot
cat <<EOD >> ~/motd.custom
### certbot by installed snapd
refs     : https://certbot.eff.org/lets-encrypt/othersnap-nginx
renewal  : sudo certbot renew --dry-run
EOD

# cron tab
cat <<EOD >> ~/motd.custom
### cron
sets     : crontab -e
logs     : cat /var/log/cron.log
stats    : sudo chkconfig cron

# logs
restart  : /etc/init.d/rsyslog restart
sets     : sudo vi /etc/rsyslog.conf
EOD


# footer
cat <<EOD >> ~/motd.custom
#########################################


EOD

cp motd motd-`date "+%Y%m%d_%H%M%S"`.bak
cp -f motd.custom motd
