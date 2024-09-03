#!/bin/bash

echo -e "\tInstalling dependencies" \
  && apt-get -qq update \
  && apt-get -qq install -y \
       python3 \
       ansible \
       gettext-base \
       sshpass \
       jq

# -----------------------

echo -e "\tExecuting Ansible " \
  && TARGET_HOST=localhost \
     LC_ALL=C.UTF-8 \
     ANSIBLE_CONFIG=./ansible/ansible.cfg \
     ANSIBLE_INVENTORY=./ansible/inventories/hosts \
     ansible-playbook ./ansible/playbooks/playbook.yml
