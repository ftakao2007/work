#!/bin/sh

# common
ansible-playbook -i ~/hosts 01_common_centos8_digitalocean.yml -u centos --private-key=~/.ssh/id_rsa

# operation
#ansible-playbook -i ~/hosts operation_centos8_digitalocean.yml -u centos --private-key=~/.ssh/id_rsa
