# Playbook to prepare ansible host

# Docker: Docker image build instruction
cd ansible-playbook

Build Docker Images: This images will have openssh-server installed and default root password set to "ubuntu"

docker build -t "ubuntu-ssh" -f prepare_ansible_host-playbook/Dockerfile .

# Ansible Play:

To generate encypted hash password run python script "userpassword.py"

Install pip module: 

pip install passlib   

Execute: ( you must have python3 installed on your system)

python3.7 userpassword.py

