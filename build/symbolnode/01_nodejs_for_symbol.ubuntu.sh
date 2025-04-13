#!/bin/sh

IP_ADDR=",68.183.182.199"
user=ubuntu

#PLAYBOOK_COMMAND="ansible-playbook"
PLAYBOOK_COMMAND="/usr/local/pyenv/shims/python -m ansible playbook"

#nvm_version=0.39.7
nvm_version=0.40.1
node_version=20.16.0
${PLAYBOOK_COMMAND} -i "${IP_ADDR}" 01_nodejs_for_symbol.ubuntu.yml -u ${user} --private-key=~/.ssh/id_rsa \
        --extra-vars "ex_var_nvm_version=${nvm_version} \
                      ex_var_node_version=${node_version}" \
