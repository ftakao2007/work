#!/bin/sh

container_name="base_ubuntu16.04"

### create container
sudo docker run --privileged -d --name=${container_name} -it ubuntu:16.04 /sbin/init

### update and install python
sudo docker exec -it ${container_name} apt-get update
sudo docker exec -it ${container_name} apt-get -y install python

### base setting
ansible-playbook -i inventory/base_ubuntu -u root -c paramiko playbook/pre_tasks_ubuntu.yml

#ansible-playbook -i inventory/base_ubuntu -u root -c paramiko playbook/site_ftakao2007.example.com_ubuntu.yml
docker restart base_ubuntu16.04
