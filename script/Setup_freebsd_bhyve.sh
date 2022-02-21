#!/bin/bash

# EXECUTE ALS ROOT
# Script voor het opzetten van bhyve in freebsd

pkg install -y sudo nano

#Eerst moeten we bhyve in kernel mode laden.
kldload vmm

#in rc.conf de volgende lijn toevoegen zodat we niet telkens de lijn hierboven moeten uitvoeren bij het starten van de computer. Kijk eventueel zelf na of in deze config file deze lijn al bestond. Zo ja, voeg dan zelf "*** vmm" toe aan de parameter en verwijder mogelijke duplicate lijnen.


sysrc kld_list="vmm"

pkg install -y vm-bhyve grub2-bhyve bhyve-firmware

#nu gaan we gebruik maken van vm-bhyve en deze installeren.


zfs create zroot/vm

sysrc vm_enable="YES"
sysrc vm_dir="zfs:zroot/vm"

vm init

#kopieer de al bestaande templates naar de map foor bhyve om te gebruiken.

mkdir -p zroot/vm/.templates


vm switch create public
vm switch add public le0

cd /zroot/vm/.iso
vm iso https://download.freebsd.org/ftp/releases/ISO-IMAGES/11.2/FreeBSD-11.2-RELEASE-amd64-bootonly.iso

#vm create myguest
#vm install [-f] myguest FreeBSD-11.2-RELEASE-amd64-bootonly.iso
#vm console myguest
