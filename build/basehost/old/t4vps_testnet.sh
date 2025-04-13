#!/bin/sh

user=ftakao2007
#key=
#address=
. ./setup_params_basehost_testnet

# test
#ssh -i ~/.ssh/${key} ${user}@${address}
#exit

# init
ansible-playbook -i ~/hosts_testnet 00_only_ansible_t4vps_testnet.yml -u ${user} --private-key=~/.ssh/${key} -K -vvv

# common
ansible-playbook -i ~/hosts_testnet 01_common_centos8_t4vps_testnet.yml -u ${user} --private-key=~/.ssh/${key} -K
