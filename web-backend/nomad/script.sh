#!/bin/sh

templateName=$1
user=$2
vak=$3

name=$user"_"$templateName
 
if (vm list | grep $name)
then
    if (vm list | grep $name-);
    then
	echo "succes"
	lastName=$(vm list | grep $name- | tail -1 | awk '$1')
	echo $lastName
        lastchar=${name: -1} #get last char
	echo "$lastchar"
        name=${name:: -1} #remove last char from name
	echo "$newName"
        newName="${name}$((lastchar + 1))" #add new last char to name
	echo "$newName"
    else
	echo "bad"
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
