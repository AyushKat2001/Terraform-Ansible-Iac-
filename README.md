## Terraform + Ansible Automation Project
#### Automates deployment of an AWS EC2 instance with Nginx using Terraform and Ansible.

- #### Project Overview

- Terraform: Provision EC2 instance, security group, and key pair.

- Ansible: Configure web server (install Nginx, deploy custom web page).

- Automation Script (run.sh): Orchestrates Terraform and Ansible end-to-end.

- #### Prerequisites

- WSL2 / Linux environment (Ubuntu recommended)

- Terraform Linux binary installed (terraform -version)

- Ansible installed (ansible-playbook --version)

- AWS CLI configured with credentials (aws configure)

- Setup Local SSH Key

- Generate a key for Terraform:

- Command - mkdir -p ~/Terraform_Ansible/Keys
            ssh-keygen -t rsa -b 4096 -f ~/Terraform_Ansible/Keys/my_terraform_key

Private key: my_terraform_key
Public key: my_terraform_key.pub

Terraform uses this key to provision EC2 and connect via Ansible.

- #### Key Commands
1. Initialize Terraform
cd ~/Terraform_Ansible/terraform
terraform init

2. Apply Terraform
terraform apply -auto-approve
Creates EC2, security group, and key pair.
Outputs the public IP.

3. Run Ansible Playbook
cd ../ansible
ansible-playbook -i inventory.ini playbook.yml
Configures EC2 instance: installs Nginx, deploys web page.

4. Full Automation
cd ~/Terraform_Ansible/terraform
chmod +x run.sh
./run.sh
Automates Terraform + Ansible end-to-end.
