#!/bin/sh

IP_ADDR=",159.89.196.242"
user=ubuntu

#PLAYBOOK_COMMAND="ansible-playbook"
PLAYBOOK_COMMAND="/usr/local/pyenv/shims/python -m ansible playbook"

### ubuntu docker
docker_compose_version=1.29.1
tag="docker"

${PLAYBOOK_COMMAND} -i "${IP_ADDR}" 00_docker_for_symbol.ubuntu.yml -u ${user} --private-key=~/.ssh/id_rsa -K -t ${tag} \
	--extra-vars "ex_var_user=${user} \
	              ex_var_docker_compose_version=${docker_compose_version}" \
