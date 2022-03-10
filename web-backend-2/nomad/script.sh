#!/bin/bash

templateName=$1
user=$2
vak=$3

name=$user"_"$templateName"_Server2"
VncPort=$(echo | cat /zroot/vm/$templateName/$templateName.conf | grep 'graphics_port' | grep -o "[0-9][0-9][0-9][0-9]")

if (vm list | grep -q $name);
then
    if (vm list | grep -q $name-);
    then
	lastName=$(vm list | grep Ubuntu | tail -1 | awk '{print $1}')
	lastchar=${lastName: -1} #get last char
        name=${lastName:: -1} #remove last char from name
        newName="${name}$((lastchar + 1))" #add new last char to name
	name=$newName
	sed -i .bak "s/$VncPort/$((VncPort + 1))/" "/zroot/vm/$templateName/$templateName.conf"
	rm /zroot/vm/$templateName/$templateName.conf.bak
	vm clone $templateName $name
    else
        name="${name}-1"
	sed -i .bak "s/$VncPort/$((VncPort + 1))/" "/zroot/vm/$templateName/$templateName.conf"
	rm /zroot/vm/$templateName/$templateName.conf.bak
	vm clone $templateName $name
    fi
else 
	sed -i .bak "s/$VncPort/$((VncPort + 1))/" "/zroot/vm/$templateName/$templateName.conf"
        rm /zroot/vm/$templateName/$templateName.conf.bak
	vm clone $templateName $name
fi

#cd /zroot/vm/$name

#vlanID=($(echo "$(vm switch list | sed "s/  */ /g" | tail -n +2 | rev |cut -d' ' -f2 | rev)" | tr ' ' '\n'))

#secondVlanID=($(echo "$(ssh root@200.200.200.102 -p 22345 vm switch list | sed "s/  */ /g" | tail -n +2 | rev |cut -d' ' -f2 | rev)" | tr ' ' '\n'))

#we're trying to find the maximum vlan id of the first server
#IFS=$'\n'
#firstMax=($(echo "${vlanID[*]}" | sort -nr | head -n1))

#we're trying to find the maximum vlan id of the second server

#IFS=$'\n'
#secondMax=($(echo "${secondVlanID[*]}" | sort -nr | head -n1))

#maxVlan=0
#if [ $firstMax -gt $secondMax ]
#then
    #maxVlan=$firstMax
#else
    #maxVlan=$secondMax
#fi


#if(vm switch list | grep -q $user)
#then
    #sed -i .bak "s/public/$user/" "$name.conf"
    #rm $name.conf.bak
#elif(ssh root@200.200.200.102 -p 22345 vm switch list | grep -q $user)
#then
    #neededVlan=$(ssh root@200.200.200.102 -p 22345 vm switch list | grep $user | sed "s/  */ /g" | rev |cut -d' ' -f2 | rev)
    #vm switch create -n ${neededVlan} -i em0 $user
    #sed -i .bak "s/public/$user/" "$name.conf"
    #rm $name.conf.bak
#else
    #maxVlan=$(($maxVlan + 10))
    #vm switch create -n ${maxVlan} -i em0 $user
    #sed -i .bak "s/public/$user/" "$name.conf"
    #rm $name.conf.bak
#fi

vm start $name
