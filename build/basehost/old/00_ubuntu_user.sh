#!/bin/sh

if [ -z "$1" ]; then IP_ADDR=",127.0.0.100"; fi
if [ -z "$2" ]; then key="id_rsa"; fi
#PLAYBOOK_COMMAND="ansible-playbook"
PLAYBOOK_COMMAND="/usr/local/pyenv/shims/python -m ansible playbook"

if [ -z "$3" ]; then init_user=root; fi
if [ -z "$4" ]; then user=ubuntu; fi
if [ -z "$5" ]; then user_id=1001; fi
if [ -z "$6" ]; then group_id=1001; fi

echo $IP_ADDR
exit

# user
${PLAYBOOK_COMMAND} -i ${IP_ADDR} 00_ubuntu_user.yml -u ${init_user} --private-key=~/.ssh/${key} \
                 --extra-vars "ex_var_user=${user} \
                               ex_var_user_id=${user_id} \
                               ex_var_group_id=${group_id}" \

