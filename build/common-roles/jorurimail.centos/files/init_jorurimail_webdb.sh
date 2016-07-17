#!/bin/bash

### WEBIP
WEB_IP_ADDR=`ifconfig | grep "inet addr" | head -n 1 | awk '{print $2}' | awk -F':' '{print $2}'`
OLD_HTTPD_CONF_ADDR=`grep ServerName /etc/httpd/conf/httpd.conf | grep -v '^#' | awk '{print $2}'`
grep -l "${OLD_HTTPD_CONF_ADDR}" /etc/httpd/conf/httpd.conf | xargs sed -i -e "s/${OLD_HTTPD_CONF_ADDR}/${WEB_IP_ADDR}/g"

OLD_CORE_CONF_ADDR=`grep -A 3 production: /var/share/jorurimail/config/core.yml | grep http | awk -F'/' '{print $3}'`
grep -l "${OLD_CORE_CONF_ADDR}" /var/share/jorurimail/config/core.yml | xargs sed -i -e "s/${OLD_CORE_CONF_ADDR}/${WEB_IP_ADDR}/g"

service mysqld restart
service httpd restart
/bin/bash --login
