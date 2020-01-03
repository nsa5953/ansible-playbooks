#!/bin/bash
# Author: Nilesh Attarde
# Ansible-Docker Lerning environment
#
#
path= $PWD
echo "This Script will create host file from your running container for your ansible testing"
__fetchIPAddress (){
for IPADDR in  `docker ps -a | awk '{print $1}' | tail -n +2`
   do
#   docker inspect $IPADDR | grep -i IPAddress | cut -d \" -f 4
    docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $IPADDR
   done;

}

# creating hosts file
cat > ../"$path"/hosts << EOF
[docker-group]
EOF

# Calling function
__fetchIPAddress >> ../"$path"/hosts
