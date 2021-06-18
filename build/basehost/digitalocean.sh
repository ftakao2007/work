#!/bin/sh

user=centos
#key=
#address=
. ./setup_params_basehost

# test
#ssh -i ~/.ssh/${key} ${user}@${address}
#exit

# init
#ansible-playbook -i ~/hosts 00_only_ansible_digitalocean.yml -u ${user} --private-key=~/.ssh/${key}

# common
ansible-playbook -i ~/hosts 01_common_centos8_digitalocean.yml -u ${user} --private-key=~/.ssh/${key}
