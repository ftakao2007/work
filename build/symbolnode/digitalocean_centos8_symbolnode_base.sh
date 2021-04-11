#!/bin/sh

user=centos
#key=
#address=
. ./setup_params_symbolnode

# test
#ssh -i ~/.ssh/${key} ${user}@${address}
#exit

### 必要なソフトのインストール
#symbol_bootstrap_version="1.0.3"
#symbol_cli_version="1.0.0"
. ./setup_params_symbolnode_base

# init_base
ansible-playbook -i ~/hosts digitalocean_centos8_symbolnode_base.yml -u ${user} --private-key=~/.ssh/${key} \
                 --extra-vars "ex_var_symbol_bootstrap_version=${symbol_bootstrap_version} \
                               ex_var_symbol_cli_version=${symbol_cli_version} \
                              "
