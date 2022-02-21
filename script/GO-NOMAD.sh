#!/bin/bash

#Dit is een install script om nomad te installeren

#nodige installaties

sudo pkg install -y nomad 

# small config change

ifconfig "lo0" name lo
