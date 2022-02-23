#!/bin/sh


user="rnummer"
vak="vaknaam"
name="$user@$templateName"

vm clone $templateName $name

sed -i 's/public/$vak/' /zroot/vm/$name.conf