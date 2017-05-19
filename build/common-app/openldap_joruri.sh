#!/bin/sh

### 設定ファイルの読み込み
. ./openldap_joruri

### 実行
ansible-playbook -i "${server}" -k -K -c paramiko openldap_joruri.yml -u ${user} --extra-vars "ldap_admin_passwd=${ldapadminpasswd} add_root_pw_template=${addrootpwtemplate} base_entry=${baseentry} base_dn=${basedn} change_base_dn_template=${changebasedntemplate} change_base_entry_template=${changebaseentrytemplate} ldap_admin_passwd_plain=${ldapadminpasswdplain}"
