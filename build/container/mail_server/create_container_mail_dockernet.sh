#!/bin/sh
container="base_centos7"

docker ps | grep ${container} > /dev/null
if [ "$?" == "0" ]; then
  docker stop ${container}
  docker rm ${container}
fi

docker-compose -f docker-compose_base_centos7.yml up -d

### 設定ファイルの読み込み
. ./setup_mail_dockernet

### 1サーバでメール送受信。LDAP利用
ansible-playbook -i "${inventory}" -c paramiko postfix_dovecot_ldap_centos7.yml -u ${user} -t add_vmail_user,smtp,ldap_smtp,imap,ldap_imap \
                 --extra-vars "host_name=${hostname} \
                               domain_name=${domainname} \
                               my_networks=\"${mynetworks}\" \
                               message_size_limit="${messagesizelimit}" \
                               mail_user=${mailuser} \
                               mail_group=${mailgroup} \
                               vmail_user=${vmailuser} \
                               vmail_uid=${vmailuid} \
                               vmail_gid=${vmailuid} \
                               vmail_passwd=${vmailpasswd} \
                               virtual_mailbox_domains=\"${virtualmailboxdomains}\" \
                               virtual_mailbox_base=${virtualmailboxbase} \
                               quota_rule_strage=${quotarulestrage} \
                               ldap_hosts=${ldaphost} \
                               ldap_port=${ldapport} \
                               ldap_base=${ldapbase} \
                              "
