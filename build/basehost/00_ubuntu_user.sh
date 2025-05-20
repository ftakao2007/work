#!/bin/sh

IP_ADDR=",157.245.207.137"
if [ -n "$1" ]; then IP_ADDR=",`head -1 $1`"; fi

key="id_rsa"
#PLAYBOOK_COMMAND="ansible-playbook"
PLAYBOOK_COMMAND="/usr/local/pyenv/shims/python -m ansible playbook"

init_user=root
user=ubuntu
user_id=1001
group_id=1001

# user
${PLAYBOOK_COMMAND} -i ${IP_ADDR} 00_ubuntu_user.yml -u ${init_user} --private-key=~/.ssh/${key} \
                 --extra-vars "ex_var_user=${user} \
                               ex_var_user_id=${user_id} \
                               ex_var_group_id=${group_id}" \
### use password
# user
#${PLAYBOOK_COMMAND} -i ${IP_ADDR} 00_ubuntu_user.yml -u ${init_user} --private-key=~/.ssh/${key} -k \
#                 --extra-vars "ex_var_user=${user} \
#                               ex_var_user_id=${user_id} \
#                               ex_var_group_id=${group_id}" \
