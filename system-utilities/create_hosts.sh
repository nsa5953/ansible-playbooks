#!/bin/bash
# Author: Nilesh Attarde
# Ansible-Docker Lerning environment
#
#
path= $PWD
echo -e "This Script will Display docker container details and create host file from your running container for your ansible testing\n"
#
#
#
__displayDETAILS (){
echo -e "* * * * * Docker Container Details * * * * *" 
for IPADDR in  `docker ps -a | awk '{print $1}' | tail -n +2`
   do
    getinfo=`docker inspect -f '{{.Name }} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $IPADDR | tr -d "/"`
    echo -e "\t$getinfo"
   done;
}

#
#
#

__fetchIPAddress (){

# creating hosts file
cat > ../"$path"/hosts << EOF
[docker_group]
EOF

## Check IP addresses of containers 
for IPADDR in  `docker ps -a | awk '{print $1}' | tail -n +2`
   do
    docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $IPADDR
   done;
}





# Calling function
__displayDETAILS
#__fetchIPAddress >> ../"$path"/hosts
