#!/bin/bash

# sudo yum update -y
# sudo amazon-linux-extras install docker
# sudo service docker start
# sudo usermod -aG docker ec2-user

# sudo docker pull <YOUR DOCKER HUB/IMAGE>
# sudo docker run --name front -p 8080:8080 -e BACKEND_HOST=${back_host} -d IMAGE

apt update
apt install software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt install -y ansible

git clone https://github.com/ManuelCoral1998/Ansible-Class.git

cd Ansible-Class/

ansible-playbook -i ./inventory/hosts -l tag_Name_tf_instance_front_icesi_health site.yml -vvv -e back_host=${back_host} -e tag=${tag}