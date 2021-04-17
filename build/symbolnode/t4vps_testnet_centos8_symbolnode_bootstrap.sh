#!/bin/sh

user=ftakao2007
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
. ./setup_params_symbolnode_bootstrap_testnet

ansible-playbook -i ~/hosts_testnet t4vps_testnet_centos8_symbolnode_bootstrap.yml -u ${user} --private-key=~/.ssh/${key} -t ${symbol_network} -K \
                 --extra-vars "ex_var_passwd=${pass} \
                               ex_var_bfaddress=${bfaddress} \
                               ex_var_symbol_network=${symbol_network} \
                              "
