#!/bin/sh

init_user=root
user=ubuntu
#key=
#address=
. ./setup_params_basehost

# test
#ssh -i ~/.ssh/${key} ${user}@${address}
#exit

# user
#ansible-playbook -i ~/hosts 00_only_ansible_digitalocean_ubuntu_user.yml -u ${init_user} --private-key=~/.ssh/${key} \
#                 --extra-vars "ex_var_user=${user}" \

# init
ansible-playbook -i ~/hosts 00_only_ansible_digitalocean_ubuntu.yml -u ${user} -K --private-key=~/.ssh/${key}

# common
ansible-playbook -i ~/hosts 01_common_ubuntu_digitalocean.yml -u ${user} -K --private-key=~/.ssh/${key}
