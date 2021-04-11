#!/bin/sh

user=centos
# $1 key=
# $2 address=
# . ./setup_params_symbolnode
if [ -n "$1" ]; then key=$1; fi
if [ -n "$2" ]; then address=$2; fi

# test
#ssh -i ~/.ssh/${key} ${user}@${address}
#exit

### bootstrapの起動
#pass=
#bfaddress=
#symbol_network=
. ./setup_params_symbolnode_bootstrap

ansible-playbook -i ~/hosts digitalocean_centos8_symbolnode_bootstrap.yml -u ${user} --private-key=~/.ssh/${key} -t ${symbol_network} \
                 --extra-vars "ex_var_passwd=${pass} \
                               ex_var_bfaddress=${bfaddress} \
                               ex_var_symbol_network=${symbol_network} \
                              "
