#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 vmid"
    exit 1
fi

#récupération des variables
vmid = $1

# 
cd /home/admuser/terraform/VM_client/$vmid

#on supprime 
terraform destroy -auto-approuve