#!/bin/bash

# EXECUTE ALS ROOT
# Script voor het opzetten van bhyve in freebsd

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

vm init

#kopieer de al bestaande templates naar de map foor bhyve om te gebruiken.

mkdir -p zroot/vm/.templates

vm switch create public
vm switch add public le0

cp -r template/* /zroot/vm/.templates/.

vm create -t ubuntu -s 4G ubuntu
vm iso https://releases.ubuntu.com/20.04/ubuntu-20.04.3-live-server-amd64.iso
vm install ubuntu .iso/ubuntu-20.04.3-live-server-amd64.iso

vm create -t freebsd -s 4G freebsd
vm iso https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.3/FreeBSD-12.3-RELEASE-amd64-bootonly.iso
vm install [-f] myguest FreeBSD-11.2-RELEASE-amd64-bootonly.iso

vm create -t windows10 -s 4G windows10

vm create -t windowsServer -s 4G windowsServer 

