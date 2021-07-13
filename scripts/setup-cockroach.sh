#!/bin/bash
set -ex
curl https://binaries.cockroachdb.com/cockroach-v21.1.5.darwin-10.9-amd64.tgz | tar -xJ && cp -i cockroach-v21.1.5.darwin-10.9-amd64/cockroach /usr/local/bin/
mkdir -p  /var/lib/cockroach
useradd cockroach
chown -R cockroach.cockroach /var/lib/cockroach

echo "Successfully fetched and installed"
