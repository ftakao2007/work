#!/bin/sh

# $1 key=
# $2 address=
# . ./setup_params_dhealth
if [ -n "$1" ]; then key=$1; fi
if [ -n "$2" ]; then address=$2; fi

user=$3

# test
#ssh -i ~/.ssh/${key} ${user}@${address}
#exit

### yourdltの起動
#pass=
#bfaddress=
#dhealth_network=
. ./setup_params_dhealth_yourdlt

ansible-playbook -i ~/hosts digitalocean_centos8_dhealth_yourdlt.yml -u ${user} --private-key=~/.ssh/${key} -t ${dhealth_network} \
                 --extra-vars "ex_var_passwd=${pass} \
                               ex_var_bfaddress=${bfaddress} \
                               ex_var_dhealth_network=${dhealth_network} \
                              "
