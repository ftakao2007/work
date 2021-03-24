#!/bin/sh
ansible-playbook -i ~/hosts symbolnode.centos8_digitalocean.yml -u centos --private-key=~/.ssh/id_rsa
