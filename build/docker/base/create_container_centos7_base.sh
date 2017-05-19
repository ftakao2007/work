#!/bin/sh

### create container
sudo docker run --privileged -d --name=base -it centos:7 /sbin/init

### base setting
ansible-playbook -i inventory/base -u root -c paramiko playbook/pre_tasks_centos.yml
ansible-playbook -i inventory/base -u root -c paramiko playbook/site_joruri.example.com_centos7.yml
docker restart base
