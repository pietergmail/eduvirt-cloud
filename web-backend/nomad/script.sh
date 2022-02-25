#!/bin/sh

templateName=$1
user=$2
vak=$3

name=$user"@"$templateName


vm clone $templateName $name

vm start $name

sed -i 's/public/$vak/' /home/t/zroot/$name.conf
