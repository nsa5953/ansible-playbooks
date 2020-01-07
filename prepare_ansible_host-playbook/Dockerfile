### Dockerfile
# Purpose: This file will create Ubuntu Based image, which has root password configured 
FROM ubuntu:latest
MAINTAINER "Nilesh Attarde"
RUN apt-get update -y && apt-get install -y systemd sudo openssh-server passwd 
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
RUN echo "root:ubuntu" | chpasswd
RUN systemctl start sshd.service 
RUN systemctl enable sshd.service
VOLUME ["/sys/fs/cgroup"]


