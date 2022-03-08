#!/bin/bash

# EXECUTE ALS ROOT
# Script voor het opzetten van bhyve in freebsd

#Eerst moeten we bhyve in kernel mode laden en dus toevoegen aan rc.conf.
sysrc kld_list="vmm"
kldload vmm

pkg install -y vm-bhyve grub2-bhyve bhyve-firmware

#nu gaan we gebruik maken van vm-bhyve en deze installeren.

#Kijk eerst met het commando zfs list na wat uw pool zijn naam is, standaard zal dit zroot zijn maar moest het anders zijn moet dit aangepast worden. Indien u geen 1 pool te zien krijgt met zfs list heeft u waarschijnlijk het ufs filesysteem geinstalleerd. Dit moet zfs zijn
zfs create zroot/vm

sysrc vm_enable="YES"
sysrc vm_dir="zfs:zroot/vm"

vm init

#kopieer de al bestaande templates naar de map foor bhyve om te gebruiken.

vm switch create public
# voeg hiermee de fysieke interface aan toe aan de public switch, kijk dit dus zelf na wat uw fysieke poort zijn naam is 
vm switch add public em0

cp -r script/template/* /zroot/vm/.templates/.

vm create -t ubuntu -s 4G ubuntu
vm iso https://releases.ubuntu.com/20.04/ubuntu-20.04.3-live-server-amd64.iso
vm install ubuntu .iso/ubuntu-20.04.3-live-server-amd64.iso

vm create -t freebsd -s 4G freebsd
vm iso https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.3/FreeBSD-12.3-RELEASE-amd64-bootonly.iso
vm install  myguest FreeBSD-11.2-RELEASE-amd64-bootonly.iso

#De iso's van windows zal u zelf moeten kopieren en dan moeten installeren
vm create -t windows10 -s 4G windows10

vm create -t windowsServer -s 4G windowsServer 

