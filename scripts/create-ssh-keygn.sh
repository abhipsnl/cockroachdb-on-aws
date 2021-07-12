#!/bin/bash

SSH_DIR="./ssh"
SSH_FILE="cockroachdb-node"
if [ ! -d "${SSH_DIR}" ];then
    mkdir ${SSH_DIR}
fi

OUTPUT=$(find ${SSH_DIR} -name "${SSH_FILE}*")
if [ ! -z "${OUTPUT}" ];then
    echo "ssh-keygen is already generated here 👉 ${SSH_DIR}"
    exit 0
fi
echo "Generating new ssh key for ${SSH_FILE}"
ssh-keygen -b 2048 -t rsa -f ${SSH_DIR}/${SSH_FILE} -q -N ""
if [ $? -ne 0 ];then
    echo "Failed to create sshkeygen file"
    exit 1
fi
echo "Here is your newly created ssh file 👉 ${SSH_DIR}"
