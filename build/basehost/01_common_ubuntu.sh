#!/bin/sh

IP_ADDR=",157.245.207.137"
if [ -n "$1" ]; then IP_ADDR=",`head -1 $1`"; fi

key="id_rsa"
#PLAYBOOK_COMMAND="ansible-playbook"
PLAYBOOK_COMMAND="/usr/local/pyenv/shims/python -m ansible playbook"

user=ubuntu

# common
${PLAYBOOK_COMMAND} -i ${IP_ADDR} 01_common_ubuntu.yml -u ${user} -K --private-key=~/.ssh/${key} \
                 --extra-vars "ex_var_user=${user}" \
