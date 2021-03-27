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
ansible-playbook -i ~/hosts aws_centos8_symbolnode.yml -u ${user} --extra-vars "ex_var_passwd=${pass}" --private-key=~/.ssh/${key}
exit

# init_bootstrap
echo "------------------------"
echo "passwd?"
read pass
echo ""
ansible-playbook -i ~/hosts aws_centos8_symbolnode_bootstrap_testnet.yml -u ${user} --extra-vars "ex_var_passwd=${pass}" --private-key=~/.ssh/${key}
#ansible-playbook -i ~/hosts aws_centos8_symbolnode_bootstrap_mainnet.yml -u ${user} --extra-vars "ex_var_passwd=${pass}" --private-key=~/.ssh/${key}
