### Dockerfile
# Purpose: This file will create Ubuntu Based image, which has root password configured 
FROM ubuntu:latest
MAINTAINER "Nilesh Attarde"
RUN echo exit 0 > /usr/sbin/policy-rc.d
RUN apt-get update -y && apt-get clean all && apt-get install -y apt-utils systemd systemd-sysv
RUN cd /lib/systemd/system/sysinit.target.wants/ \
    && ls | grep -v systemd-tmpfiles-setup | xargs rm -f $1

RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/basic.target.wants/* \
    /lib/systemd/system/anaconda.target.wants/* \
    /lib/systemd/system/plymouth* \
    /lib/systemd/system/systemd-update-utmp*

##### OpenSSH server Configuration
RUN apt-get install -y sudo passwd openssh-server

# Permit Root Login
RUN sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
#RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN echo "root:ubuntu" | chpasswd \
    mkdir /var/run/sshd \
VOLUME ["/sys/fs/cgroup"]
EXPOSE 22

WORKDIR /
#COPY prepare_ansible_host-playbook/startService.sh /startService.sh
#RUN chmod +x /startService.sh
CMD ["/usr/sbin/sshd", "-D"]
ENTRYPOINT [ "/bin/bash" ]
