#!/bin/bash

templateName=$1
user=$2
vak=$3

name=$user"_"$templateName
 
if (vm list | grep -q $name)
then
    if (vm list | grep -q $name-);
    then
	lastName=$(vm list | grep Ubuntu | tail -1 | awk '{print $1}')
	lastchar=${lastName: -1} #get last char
	echo "$lastchar"
        name=${lastName:: -1} #remove last char from name
        newName="${name}$((lastchar + 1))" #add new last char to name
	echo "$newName"
	name=$newName
    else
        name="${name}-1"
    fi
fi

vm clone $templateName $name

cd /zroot/vm/$name

if(vm switch list | grep $vak)
then
    sed -i .bak "s/public/$vak/" "$name.conf"
    rm $name.conf.bak
else
    vm switch create $vak
    #vm switch add $vak em0
    sed -i .bak "s/public/$vak/" "$name.conf"
    rm $name.conf.bak
fi

vm start $name
