#!/bin/bash

echo "intsalling bhyve..."
bash script/Setup_freebsd_bhyve.sh

echo "installing npm..."
pkg install npm -y

cd web-backend-2
npm install
npm run build
