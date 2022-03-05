#!/bin/bash

echo "intsalling bhyve..."
bash script/Setup_freebsd_bhyve.sh

echo "installing npm..."
pkg install npm -y

cd web-frontend
npm install
npm run build

cd ..
cd web-backend
npm install
npm run build
