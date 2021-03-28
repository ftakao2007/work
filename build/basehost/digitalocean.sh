#!/bin/sh

user=centos
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
ssh -i ~/.ssh/${key} ${user}@${address}
exit

# init
ansible-playbook -i ~/hosts 00_only_ansible_digitalocean.yml -u ${user} --private-key=~/.ssh/${key}

# common
ansible-playbook -i ~/hosts 01_common_centos8_digitalocean.yml -u ${user} --private-key=~/.ssh/${key}
