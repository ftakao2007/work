#!/bin/sh

user=ec2-user
#key=
#address=

. ./setup_params_basehost
echo $key
echo $address

# test
ssh -i ~/.ssh/${key} ${user}@${address}
exit

# init
ansible-playbook -i ~/hosts 00_only_ansible_aws.yml -u ${user} --private-key=~/.ssh/${key}

# common
#ansible-playbook -i ~/hosts 01_common_centos8_aws.yml -u ${user} --private-key=~/.ssh/${key}

