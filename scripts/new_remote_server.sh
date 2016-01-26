#!/bin/bash

NEW_USER=apporc
PASSWORD=abc123
REMOTE_SERVER=$1

ssh root@${REMOTE_SERVER} "adduser ${NEW_USER} && echo ${NEW_USER}:${PASSWORD} | chpasswd"
ssh-copy-id -i ${HOME}/.ssh/id_rsa.pub ${NEW_USER}@${REMOTE_SERVER}
scp ${HOME}/.tmux.conf ${NEW_USER}@${REMOTE_SERVER}:~

# Host $(echo ${REMOTE_SERVER} | cut -d. -f4)
cat >> ${HOME}/.ssh/config << EOF
Host ${REMOTE_SERVER##[0-9]?*\.}
HostName $REMOTE_SERVER
    User apporc
    Port 22
EOF
