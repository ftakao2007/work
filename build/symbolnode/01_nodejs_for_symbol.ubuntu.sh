#!/bin/sh

IP_ADDR=",159.89.196.242"
user=ubuntu

#PLAYBOOK_COMMAND="ansible-playbook"
PLAYBOOK_COMMAND="/usr/local/pyenv/shims/python -m ansible playbook"

nvm_version=0.40.2
node_version=22.14.0
${PLAYBOOK_COMMAND} -i "${IP_ADDR}" 01_nodejs_for_symbol.ubuntu.yml -u ${user} --private-key=~/.ssh/id_rsa \
        --extra-vars "ex_var_nvm_version=${nvm_version} \
                      ex_var_node_version=${node_version}" \
