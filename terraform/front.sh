#!/bin/bash
apt update
apt install software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt install -y ansible
git clone -b ansible https://github.com/CarlosEduardoL/IcesiHealth.git
cd IcesiHealth/ansible
ansible-playbook -i ./hosts -l tag_Name_tf_instance_front_icesi_health site.yml -vvv -e back_host=${back_host} -e tag=${tag}