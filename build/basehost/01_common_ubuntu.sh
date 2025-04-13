#!/bin/sh

IP_ADDR=",68.183.182.199"
key="id_rsa"
#PLAYBOOK_COMMAND="ansible-playbook"
PLAYBOOK_COMMAND="/usr/local/pyenv/shims/python -m ansible playbook"

user=ubuntu

# common
${PLAYBOOK_COMMAND} -i ${IP_ADDR} 01_common_ubuntu.yml -u ${user} -K --private-key=~/.ssh/${key} \
                 --extra-vars "ex_var_user=${user}" \
