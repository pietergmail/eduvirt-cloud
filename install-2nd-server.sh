#!/bin/bash

echo "intsalling bhyve..."
bash script/Setup_freebsd_bhyve.sh

echo "installing npm..."
pkg install -y npm

cd web-backend-2
npm install
node server.js
