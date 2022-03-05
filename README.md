# eduvirt-cloud
Afstudeerproject ucll

Focus op leesbare en makkelijk onderhoudbare infrastructuur.


# Gebruik
Om de software te installeren kan simpelweg het install.sh script uitgevoerd worden.

Dit script is geschreven voor freeBSD versie 12.3 met een ZFS file system.
Er word ook vanuit gegaan dat u root bent als het script uitgevoerd wordt.
Het is ook geschreven in bash en je zal dus bash moeten installeren op freeBSD om het uit te voeren.

```cs
pkg install bash
```
Daarna kan je het script uitvoeren met
```cs
bash install.sh
```

## ip adressen
Veel files in de back-end en front-end hebben hardcoded ip-adressen.
Deze moeten aangepast worden om het project te kunnen gebruiken.
Deze files zijn:

* web-frontend/src/views/AddMachine.vue 
* rest moe Illias aanvullen
* ...

## open-id
Open-id koden staat klaar maar is nog niet geimplementeerd.
Om open-id te gebruiken moet er een domein en https zijn.
Dit is nog niet uitgebreid getest aangezien wij geen domein hadden.
Je kan open-id activeren door deze file aan te passen
```cs
geen idee Ilias heeft dees stuk gedaan
```
## windows
De windows iso files worden niet automatisch gedownload en moeten zelf worden toegevoegd.
deze moeten geplaatst worden in:
```cs
/zroot/vm/.iso
```
daarna deze isntalleren in de vms:
windows 10:
```cs
vm install windows10 windows10.iso
```

windows server:
```cs
vm install windowsServer windowsServer.iso
```
