#!/bin/sh

templateName=$1
user=$2
vak=$3

name=$user"@"$templateName


vm clone $templateName $name

<<<<<<< HEAD
vm start $name

sed -i 's/public/$vak/' /home/t/zroot/$name.conf
=======
sed -i 's/public/$vak/' /home/t/zroot/$name.conf
>>>>>>> 7d30755e434b7df0d0a585ce3ef9f2e8da5f1f23
