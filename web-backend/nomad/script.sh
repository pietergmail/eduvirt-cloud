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
	VncPort=$(echo | cat /zroot/vm/$lastName/$lastName.conf | grep 'graphics_port' | grep -o "[0-9][0-9][0-9][0-9]")
	echo $VncPort
	lastchar=${lastName: -1} #get last char
        name=${lastName:: -1} #remove last char from name
        newName="${name}$((lastchar + 1))" #add new last char to name
	name=$newName
	vm clone $templateName $name
	sed -i .bak "s/$VncPort/$((VncPort + 1))/" "/zroot/vm/$name/$name.conf"
	VncPort=$((VncPort + 1))
	echo $VncPort
	rm /zroot/vm/$name/$name.conf.bak
    else
	VncPort=$(echo | cat /zroot/vm/$name/$name.conf | grep 'graphics_port' | grep -o "[0-9][0-9][0-9][0-9]")
	echo $VncPort
        name="${name}-1"
	vm clone $templateName $name
	sed -i .bak "s/$VncPort/$((VncPort + 1))/" "/zroot/vm/$name/$name.conf"
	rm /zroot/vm/$name/$name.conf.bak
    fi
else 
	vm clone $templateName $name
fi

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
