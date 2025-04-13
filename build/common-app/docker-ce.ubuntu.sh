#!/bin/sh

IP_ADDR=",68.183.182.199"
user=ubuntu

#PLAYBOOK_COMMAND="ansible-playbook"
PLAYBOOK_COMMAND="/usr/local/pyenv/shims/python -m ansible playbook"

### ubuntu docker
tag="docker"

### docker-composeの最新はdockerインストール時のpluginでインストールされる
#docker_compose_version=2.35.0
#tag="docker,docker-compose"
#tag="docker-compose"
#
#${PLAYBOOK_COMMAND} -i "${IP_ADDR}" docker-ce.ubuntu.yml -u ${user} --private-key=~/.ssh/id_rsa -K -t ${tag} \
#	--extra-vars "ex_var_user=${user} \
#	              ex_var_docker_compose_version=${docker_compose_version}" \

${PLAYBOOK_COMMAND} -i "${IP_ADDR}" docker-ce.ubuntu.yml -u ${user} --private-key=~/.ssh/id_rsa -K -t ${tag} \
	--extra-vars "ex_var_user=${user} \
	              ex_var_docker_compose_version=${docker_compose_version}" \
