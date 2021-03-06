#!/bin/sh

user=ec2-user
#key=
#address=
. ./setup_params_symbolnode

# test
#ssh -i ~/.ssh/${key} ${user}@${address}
#exit


#symbol_bootstrap_version="1.0.3"
#symbol_cli_version="1.0.0"
. ./setup_params_symbolnode_version

# init_base
ansible-playbook -i ~/hosts aws_centos8_symbolnode.yml -u ${user} --private-key=~/.ssh/${key} \
                 --extra-vars "ex_var_symbol_bootstrap_version=${symbol_bootstrap_version} \
                               ex_var_symbol_cli_version=${symbol_cli_version} \
                              "

#pass=
#bfaddress=
#symbol_network=
. ./setup_params_symbolnode_bootstrap
exit

ansible-playbook -i ~/hosts aws_centos8_symbolnode_bootstrap_make_workdir.yml -u ${user} --private-key=~/.ssh/${key} \
                 --extra-vars "ex_var_passwd=${pass} \
                               ex_var_bfaddress=${bfaddress} \
                               ex_var_symbol_network=${symbol_network} \
                              "
