#!/bin/bash

# EXECUTE ALS ROOT
# Script voor het opzetten van bhyve in freebsd

pkg install -y sudo nano

#Eerst moeten we bhyve in kernel mode laden.
kldload vmm

#in rc.conf de volgende lijn toevoegen zodat we niet telkens de lijn hierboven moeten uitvoeren bij het starten van de computer. Kijk eventueel zelf na of in deze config file deze lijn al bestond. Zo ja, voeg dan zelf "*** vmm" toe aan de parameter en verwijder mogelijke duplicate lijnen.

echo 'if_bridge_load="YES"' >> /boot/loader.conf
echo 'if_tap_load="YES"' >> /boot/loader.conf
echo 'nmdm_load="YES"' >> /boot/loader.conf
echo 'vmm_load="YES"' >> /boot/loader.conf

sysctl net.link.tap.up_on_open=1
sysctl net.link.bridge.ipfw=1
sysctl net.link.bridge.pfil_bridge=0
sysctl net.link.bridge.pfil_member=0

sysrc kld_list="vmm"
sysrc vm_list=""

pkg install -y vm-bhyve grub2-bhyve bhyve-firmware

#nu gaan we gebruik maken van vm-bhyve en deze installeren.


zfs create zroot/vm

sysrc vm_enable="YES"
sysrc vm_dir="zfs:zroot/vm"

cd /zroot/vm

vm init

#kopieer de al bestaande templates naar de map foor bhyve om te gebruiken.

mkdir -p zroot/vm/.templates


vm switch create public
vm switch add public le0

cd /usr/local/share/examples/vm-bhyve

cp windows.conf /zroot/vm/.templates/windows10.conf
cp windows.conf /zroot/vm/.templates/windows2022.conf
cp ubuntu.conf /zroot/vm/.templates/mint.conf
cp freebsd-zvol.conf /zroot/vm/.templates/freebsd.conf
cp freebsd-zvol.conf /zroot/vm/.templates/freebsd.conf.bac

cd zroot/vm

vm create -t ubuntu -s 8G ubuntu
vm iso https://releases.ubuntu.com/20.04/ubuntu-20.04.3-live-server-amd64.iso
vm install ubuntu .iso/ubuntu-20.04.3-live-server-amd64.iso



#cd /zroot/vm/.iso
#vm iso https://download.freebsd.org/ftp/releases/ISO-IMAGES/11.2/FreeBSD-11.2-RELEASE-amd64-bootonly.iso

#vm create myguest
#vm install [-f] myguest FreeBSD-11.2-RELEASE-amd64-bootonly.iso
#vm console myguest


#om guests te auto starten bij boot kan je die zo toevoegen "sysrc vm_list="myubuntu"
