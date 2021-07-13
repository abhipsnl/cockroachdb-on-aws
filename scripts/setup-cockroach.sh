#!/bin/bash
set -ex

VERSION="v21.1.5"

function install_cockroachdb_cli() {

    if [ -f /usr/local/bin/cockroach ];then
        echo "Already installed, skipping"
        exit 0
    fi

    wget -qO- https://binaries.cockroachdb.com/cockroach-${VERSION}.darwin-10.9-amd64.tgz | tar  xvz
    if [ $? -ne 0 ];then
        echo "Failed to download cockroachdb CLI"
        exit 1
    fi

    cp cockroach-${VERSION}.darwin-10.9-amd64/cockroach /usr/local/bin/ -f

    if [ ! -d /var/lib/cockroach ];then
        mkdir /var/lib/cockroach
        useradd cockroach
        chown -R cockroach.cockroach /var/lib/cockroach
    fi

    echo "Successfully installed CLI version"

}

install_cockroachdb_cli
