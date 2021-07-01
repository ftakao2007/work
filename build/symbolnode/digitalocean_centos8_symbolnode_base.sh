#!/bin/sh

# $1 key=
# $2 address=
# . ./setup_params_symbolnode
if [ -n "$1" ]; then key=$1; fi
if [ -n "$2" ]; then address=$2; fi

user=$3

# test
#ssh -i ~/.ssh/${key} ${user}@${address}
#exit

### 必要なソフトのインストール
# $4 symbol_bootstrap_version="1.0.3"
# $5 symbol_cli_version="1.0.0"
#. ./setup_params_symbolnode_base
if [ -n "$4" ]; then symbol_bootstrap_version=$4; fi
if [ -n "$5" ]; then symbol_cli_version=$5; fi

# init_base
ansible-playbook -i ~/hosts digitalocean_centos8_symbolnode_base.yml -u ${user} --private-key=~/.ssh/${key} \
                 --extra-vars "ex_var_user_name=${user} \
		               ex_var_symbol_bootstrap_version=${symbol_bootstrap_version} \
                               ex_var_symbol_cli_version=${symbol_cli_version} \
                              "
