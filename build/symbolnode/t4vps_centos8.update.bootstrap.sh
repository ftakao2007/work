#!/bin/sh

### bootstrap_preset
#ansible-playbook -i ~/hosts symbolnode.centos8.update.bootstrap_t4vps.yml -u ftakao2007 --private-key=~/.ssh/id_rsa -K -t symbolbootstrap_install_preset

### bootstrap_set_symlink dry-run
ansible-playbook -i ~/hosts symbolnode.centos8.update.bootstrap_t4vps.yml -u ftakao2007 --private-key=~/.ssh/id_rsa -K -t symbolbootstrap_install_set_symlink --check

### bootstrap_set_symlink
#ansible-playbook -i ~/hosts symbolnode.centos8.update.bootstrap_t4vps.yml -u ftakao2007 --private-key=~/.ssh/id_rsa -K -t symbolbootstrap_install_set_symlink

### upgrade_bootstrap_mainnnet
#ansible-playbook -i ~/hosts symbolnode.centos8.update.bootstrap_t4vps.yml -u ftakao2007 --private-key=~/.ssh/id_rsa -K
