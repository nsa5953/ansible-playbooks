# Playbook to prepare ansible host
# Dockerfile build image instruction: 
cd ansible-playbook   

run: 

docker build -t "ubuntu-ssh" -f prepare_ansible_host-playbook/Dockerfile .
