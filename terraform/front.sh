#!/bin/bash

apt update
apt install software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt install -y ansible

git clone https://github.com/ManuelCoral1998/Ansible-Class.git

cd Ansible-Class/

ansible-playbook -i ./inventory/hosts -l tag_Name_tf_instance_front_icesi_health site.yml -vvv -e back_host=${back_host} -e tag=${tag}