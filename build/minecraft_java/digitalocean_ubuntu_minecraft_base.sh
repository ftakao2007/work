#!/bin/sh

user=ubuntu
# $1 key=
# $2 address=
# . ./setup_params_minecraft
if [ -n "$1" ]; then key=$1; fi
if [ -n "$2" ]; then address=$2; fi

# test
#ssh -i ~/.ssh/${key} ${user}@${address}
#exit

### 必要なソフトのインストール
# $3 openjdk_version="1.8.0"
#. ./setup_params_minecraft_base
if [ -n "$3" ]; then openjdk_version=$3; fi

# init_base
ansible-playbook -i ~/hosts digitalocean_ubuntu_minecraft_base.yml -u ${user} -K --private-key=~/.ssh/${key} \
                 --extra-vars "ex_var_openjdk_version=${openjdk_version} \
                              "
