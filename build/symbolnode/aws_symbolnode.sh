#!/bin/sh

user=ec2-user
#key=
#address=

echo "private key path?"
ls ~/.ssh
read key
echo ""

echo "------------------------"
echo "address?"
cat ~/hosts
read address
echo ""

# test
#ssh -i ~/.ssh/${key} ${user}@${address}
#exit

# init_base
#ansible-playbook -i ~/hosts aws_centos8_symbolnode.yml -u ${user} --private-key=~/.ssh/${key}

# init_bootstrap
echo "------------------------"
echo "bootstrap passwd?"
read pass
echo ""
echo "------------------------"
echo "beneficiaryAddress?"
read bfaddress
echo ""
echo "------------------------"
echo "symbol_network? [ mainnet / testnet ]"
read symbol_network
echo ""

ansible-playbook -i ~/hosts aws_centos8_symbolnode_bootstrap_make_workdir.yml -u ${user} --private-key=~/.ssh/${key} \
                 --extra-vars "ex_var_passwd=${pass} \
                               ex_var_bfaddress=${bfaddress} \
                               ex_var_symbol_network=${symbol_network} \
                              "
