#!/bin/bash

### WEB
WEB_IP_ADDR=`ifconfig | grep "inet addr" | head -n 1 | awk '{print $2}' | awk -F':' '{print $2}'`
OLD_WEB_IP_ADDR=`grep ServerName /etc/httpd/conf/httpd.conf | grep -v '^#' | awk '{print $2}'`
grep -l "${OLD_WEB_IP_ADDR}" /var/share/jorurigw/config/core.yml | xargs sed -i -e "s/${OLD_WEB_IP_ADDR}/${WEB_IP_ADDR}/g"
grep -l "${OLD_WEB_IP_ADDR}" /etc/httpd/conf/httpd.conf | xargs sed -i -e "s/${OLD_WEB_IP_ADDR}/${WEB_IP_ADDR}/g"

### DATABASE
IP_3306=`env | grep PORT_3306_TCP_ADDR | awk -F'=' '{print $2}'`
env | grep `eval echo $"JORURIGW_DB${suffix}_PORT_3306_TCP_ADDR"` | awk -F'=' '{print $2}'
OLD_DATABASE_IP_ADDR=`grep -A 15 production: /var/share/jorurigw/config/database.yml  | tail -n 1 | awk '{print $2}'`
grep -l "${OLD_DATABASE_IP_ADDR}" /var/share/jorurigw/config/database.yml | xargs sed -i -e "s/${OLD_DATABASE_IP_ADDR}/${IP_3306}/g"

### MAIL
IP_25=`env | grep PORT_25_TCP_ADDR | awk -F'=' '{print $2}'`
OLD_SMTP_IP_ADDR=`grep -A 5 config.action_mailer.smtp_settings /var/share/jorurigw/config/environments/production.rb | grep -v '#' | grep address | awk -F'"' '{print $2}'`
grep -l "${OLD_SMTP_IP_ADDR}" /var/share/jorurigw/config/environments/production.rb | xargs sed -i -e "s/${OLD_SMTP_IP_ADDR}/${IP_25}/g"

### LDAP
IP_389=`env | grep PORT_389_TCP_ADDR | awk -F'=' '{print $2}'`
OLD_LDAP_IP_ADDR=`cat /var/share/jorurigw/config/ldap.yml | grep host | tail -1 | awk '{print $2}'`
grep -l "${OLD_LDAP_IP_ADDR}" /var/share/jorurigw/config/ldap.yml | xargs sed -i -e "s/${OLD_LDAP_IP_ADDR}/${IP_389}/g"

service memcached start
service httpd start
service sshd start
service xrdp restart
/bin/bash --login
