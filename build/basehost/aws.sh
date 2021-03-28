#!/bin/sh

user=ec2-user
#key=
#address=

echo "private key?"
ls ~/.ssh | egrep -v "known_hosts|authorized_keys"
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

# common
ansible-playbook -i ~/hosts 00_only_ansible_aws.yml -u ${user} --private-key=~/.ssh/${key}
#ansible-playbook -i ~/hosts 01_common_centos8_aws.yml -u ${user} --private-key=~/.ssh/${key}

