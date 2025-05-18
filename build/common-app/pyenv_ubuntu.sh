#!/bin/sh

IP_ADDR=",185.250.37.179"
user=ubuntu
user_group=ubuntu
user_home="/home/ubuntu"
pyenv_python_version=3.11.10

#PLAYBOOK_COMMAND="ansible-playbook"
PLAYBOOK_COMMAND="/usr/local/pyenv/shims/python -m ansible playbook"

${PLAYBOOK_COMMAND} -i "${IP_ADDR}" pyenv_ubuntu.yml -u ubuntu --private-key=~/.ssh/id_rsa -K \
	--extra-vars "ex_var_user=${user} \
                      ex_var_user_group=${user_group} \
                      ex_var_user_home=${user_home} \
		      ex_pyenv_python_version=${pyenv_python_version}" \
