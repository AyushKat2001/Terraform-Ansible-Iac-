#!/bin/bash
set -e

# Terraform
terraform init
terraform apply -auto-approve

# Ansible
cd ../ansible
sleep 60
ansible-playbook -i inventory.ini playbook.yml

echo "Deployment Done!"