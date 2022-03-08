#!/bin/bash

echo "intsalling bhyve..."
bash script/Setup_freebsd_bhyve.sh

echo "installing npm..."
pkg install -y npm

cd web-frontend
npm install
npm run serve

cd ..
cd web-backend
npm install
node server.js
