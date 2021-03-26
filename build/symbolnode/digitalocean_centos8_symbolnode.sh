#!/bin/sh

### init
ansible-playbook -i ~/hosts digitalocean_centos8_symbolnode.yml -u centos --private-key=~/.ssh/id_rsa

### setup_testnet
#ansible-playbook -i ~/hosts digitalocean_centos8_symbolnode_testnet.yml -u centos --private-key=~/.ssh/id_rsa

### setup_mainnet
#ansible-playbook -i ~/hosts symbolnode.centos8_digitalocean.yml -u centos --private-key=~/.ssh/id_rsa


