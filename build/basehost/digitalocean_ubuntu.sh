#!/bin/sh

#PLAYBOOK_COMMAND="ansible-playbook"
PLAYBOOK_COMMAND="/usr/local/pyenv/shims/python -m ansible playbook"

init_user=root
user=ubuntu
user_id=1001
group_id=1001
#key=
#address=
. ./setup_params_basehost

# test
#ssh -i ~/.ssh/${key} ${user}@${address}
#ssh -i ~/.ssh/${key} ${init_user}@${address}
#exit

# user
#${PLAYBOOK_COMMAND} -i ~/hosts 00_only_ansible_digitalocean_ubuntu_user.yml -u ${init_user} --private-key=~/.ssh/${key} \
#                 --extra-vars "ex_var_user=${user} \
#                               ex_var_user_id=${user_id} \
#                               ex_var_group_id=${group_id}" \

# init
#${PLAYBOOK_COMMAND} -i ~/hosts 00_only_ansible_digitalocean_ubuntu.yml -u ${user} -K --private-key=~/.ssh/${key} \
#	         --extra-vars "ex_var_user=${user}" \

# common
${PLAYBOOK_COMMAND} -i ~/hosts 01_common_ubuntu_digitalocean.yml -u ${user} -K --private-key=~/.ssh/${key} \
                 --extra-vars "ex_var_user=${user}" \
