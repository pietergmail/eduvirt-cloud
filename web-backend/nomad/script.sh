#!/bin/sh

templateName=$1
user=$2
vak=$3

name=$user"_"$templateName

vm clone $templateName $name

cd /zroot/vm/$name

sed -i 's/public/$vak/' $name.conf

vm start $name
