#!/bin/bash

echo "Installing dependencies" \
  && apt-get update \
  && apt-get install -y \
    ansible \
    python3 

echo "Executing ansible" \
  LC_ALL=C.UTF-8 \
    ansible-playbook \
    ./playbooks/playbook.yml \
    --inventory \
    ./inventories/hosts  
