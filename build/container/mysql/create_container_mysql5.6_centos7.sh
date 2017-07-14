#!/bin/sh

container="base_centos7"

docker ps | grep ${container} > /dev/null
if [ "$?" == "0" ]; then
  docker stop ${container}
  docker rm ${container}
fi

docker-compose -f docker-compose_base_centos7.yml up -d
ansible-playbook -i inventory/base_centos7 -u root -c paramiko playbook/mysql5.6_centos7.yml
