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

### minecraftのインストール
# $3 forge_version="1.13.2-25.0.209"
# $4 ms_memory_mb="1024"
# $5 mx_memory_mb="1024"
#. ./setup_params_minecraft_install
if [ -n "$3" ]; then forge_version=$3; fi
if [ -n "$4" ]; then ms_memory_mb=$4; fi
if [ -n "$5" ]; then mx_memory_mb=$5; fi

ansible-playbook -i ~/hosts digitalocean_ubuntu_minecraft_install.yml -u ${user} --private-key=~/.ssh/${key} \
                 --extra-vars "ex_var_forge_version=${forge_version} \
                               ex_var_ms_memory_mb=${ms_memory_mb} \
                               ex_var_mx_memory_mb=${mx_memory_mb} \
                              "
