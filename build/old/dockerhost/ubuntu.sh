#!/bin/sh

user=ubuntu
user_home="/home/ubuntu"

#PLAYBOOK_COMMAND="ansible-playbook"
PLAYBOOK_COMMAND="/usr/local/pyenv/shims/python -m ansible playbook"
IP_ADDR=",178.128.94.162"

${PLAYBOOK_COMMAND} -i "${IP_ADDR}" ubuntu.yml -u ubuntu --private-key=~/.ssh/id_rsa -K \
	--extra-vars "ex_var_user=${user} \
                      ex_var_user_home=${user_home}" \
