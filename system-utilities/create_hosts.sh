#!/bin/bash
# Author: Nilesh Attarde
# Ansible-Docker Lerning environment
#
#
path= $PWD
echo -e "This Script will Display docker container details and create host file from your running container for your ansible testing\n"
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
__updateHosts (){

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

# use case statement to make decision for rental
option=$1
select option in "List containers" "update hosts" "Quit"
do
   case $option in
      "List containers") __displayDETAILS;;
      "update hosts") echo -e "`__updateHosts >> ../"$path"/hosts` Hosts updated"
                     exit 1;;
      "Quit") exit 1;;
      *)  
      echo "`basename ${0}`:Select appropriate options" 
   esac
done