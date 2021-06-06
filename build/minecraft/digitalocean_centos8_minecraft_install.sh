#!/bin/sh

user=centos
# $1 key=
# $2 address=
# . ./setup_params_minecraft
if [ -n "$1" ]; then key=$1; fi
if [ -n "$2" ]; then address=$2; fi

# test
#ssh -i ~/.ssh/${key} ${user}@${address}
#exit

### minecraftのインストール
# $3 openjdk_version="1.8.0"
#. ./setup_params_minecraft_install
if [ -n "$3" ]; then openjdk_version=$3; fi

ansible-playbook -i ~/hosts digitalocean_centos8_minecraft_install.yml -u ${user} --private-key=~/.ssh/${key} \
                 --extra-vars "ex_var_openjdk_version=${openjdk_version} \
                              "
