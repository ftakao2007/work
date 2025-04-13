#!/bin/sh

IP_ADDR=",68.183.182.199"
user=ubuntu

#PLAYBOOK_COMMAND="ansible-playbook"
PLAYBOOK_COMMAND="/usr/local/pyenv/shims/python -m ansible playbook"

### ubuntu docker
docker_compose_version=1.29.1
#tag="docker"
#tag="docker,docker-compose"
tag="docker-compose"

${PLAYBOOK_COMMAND} -i "${IP_ADDR}" 00_docker_for_symbol.ubuntu.yml -u ${user} --private-key=~/.ssh/id_rsa -K -t ${tag} \
	--extra-vars "ex_var_user=${user} \
	              ex_var_docker_compose_version=${docker_compose_version}" \

