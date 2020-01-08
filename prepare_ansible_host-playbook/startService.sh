#!/bin/bash
# Script to start sshd service inside container 
service ssh start
systemctl enable ssh
