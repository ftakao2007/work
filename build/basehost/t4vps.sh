#!/bin/sh

user=ftakao2007
#key=
#address=
. ./setup_params_basehost

# test
ssh -i ~/.ssh/${key} ${user}@${address}
exit

# init
#ansible-playbook -i ~/hosts 00_only_ansible_t4vps.yml -u ${user} --private-key=~/.ssh/${key} -K

# common
#ansible-playbook -i ~/hosts 01_common_centos8_t4vps.yml -u ${user} --private-key=~/.ssh/${key} -K

