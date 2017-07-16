#!/bin/sh

ansible-playbook -i inventory/base -k -c paramiko playbook/create_container.yml
ansible-playbook -i inventory/base -u root -c paramiko playbook/init_centos6.yml
