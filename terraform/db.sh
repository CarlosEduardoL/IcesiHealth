#!/bin/bash
apt update
apt install software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt install -y ansible
git clone https://github.com/CarlosEduardoL/IcesiHealth.git
cd IcesiHealth/ansible
ansible-playbook -i ./hosts -l tag_Name_DB_instance_icesi_health site.yml -vvv