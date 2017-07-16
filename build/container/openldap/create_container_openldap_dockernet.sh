#!/bin/sh
container="base_centos7"

docker ps | grep ${container} > /dev/null
if [ "$?" == "0" ]; then
  docker stop ${container}
  docker rm ${container}
fi

docker-compose -f docker-compose_base_centos7.yml up -d

### 設定ファイルの読み込み
. ./setup_openldap_dockernet

### 実行
ansible-playbook -i ${inventory} -c paramiko setup_openldap_dockernet.yml -u ${user} --extra-vars "ldap_admin_passwd=${ldapadminpasswd} add_root_pw_template=${addrootpwtemplate} base_entry=${baseentry} base_dn=${basedn} change_base_dn_template=${changebasedntemplate} change_base_entry_template=${changebaseentrytemplate} ldap_admin_passwd_plain=${ldapadminpasswdplain}"
