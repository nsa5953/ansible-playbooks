# Playbook to prepare ansible host

## Docker: Docker image build instruction

```Docker
cd ansible-playbook
docker build -t "ubuntu-ssh" -f prepare_ansible_host-playbook/Dockerfile .

Build Docker Images: This images will have openssh-server installed and default root password set to "ubuntu"
```

# Ansible Play:

To generate encypted hash password run python script "userpassword.py"

Install pip module: 

```python
pip install passlib   
```
Execute: ( you must have python3 installed on your system)

```python
python3.7 userpassword.py
```
