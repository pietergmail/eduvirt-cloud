#!/bin/sh

templateName=$1
user=$2
vak=$3

name=$user"_"$templateName

if (vm list | grep $name)
then
    if($name | grep "_")
    then
        lastchar=${name: -1} #get last char
        name=${name:: -1} #remove last char from name
        name+=$((lastchar + 1)) #add new last char to name
    else
        name+=_1
    fi
fi

vm clone $templateName $name

cd /zroot/vm/$name

if(vm switch list | grep $vak)
then
    sed -i "s/public/$vak/" "$name.conf"
else
    vm switch create $vak
    #vm switch add $vak em0
    sed -i "s/public/$vak/" "$name.conf"
fi

vm start $name
