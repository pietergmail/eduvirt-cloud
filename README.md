# eduvirt-cloud
Afstudeerproject ucll

Focus op leesbare en makkelijk onderhoudbare infrastructuur.



# Gebruik
Om deze software te installeren voer je het bash script install.sh uit als root.

Dit script is geschreven voor freeBSD versie 12.3 met een ZFS file system.
Instructies voor installeren van bash:
```cs
pkg install bash
```
Daarna kan je het script uitvoeren met:
```cs
bash install.sh
```

## ip adressen
Het project in huidige status heeft hardcoded ip-adressen.
Deze moeten aangepast worden naar de juiste IP's om het project te kunnen gebruiken.
Deze files zijn:

De axios post en get methodes:
```cs
web-frontend/src/views/AddMachine.vue 
web-frontend/src/views/Login.vue 
web-frontend/src/views/Machines.vue
```

## open-id
Open-id code staat klaar maar is nog niet geimplementeerd.
Om open-id te gebruiken moet er een domein en https beschikbaar zijn.
Dit is nog niet uitgebreid getest aangezien wij geen domein hadden.
Je kan open-id activeren door deze file aan te passen
```cs
web-frontend/src/auth/authGuard.js
-> uncomment hele file.

web-frontend/src/auth/index.js
-> uncomment hele file verander redirecrUri naar juiste callback URL.

web-frontend/src/main.js
-> uncomment OpenID Connect block.

web-frontend/src/router/index.js
-> uncomment OpenID Conntect import en bij elke path router de beforeEnter uncommenten.

web-frontend/auth_config.json
-> hier vul je de domain en clientId van je Auth0 Applicatie in.


```
## windows
De windows iso-files worden niet automatisch gedownload en moeten zelf worden toegevoegd.
Deze moeten geplaatst worden in:
```cs
/zroot/vm/.iso
```
Daarna deze isntalleren in de vms:
windows 10:
```cs
vm install windows10 windows10.iso
```

windows server:
```cs
vm install windowsServer windowsServer.iso
```
## ssh keys
Om ervoor te zorgen dat communicatie veilig mogelijk is tussen de web-back-end en server-back-end moeten er ssh-keys geconfigureerd zijn tussen alle servers. Dit zorgt er ook voor dat de commandos naar de andere servers, die in de scripts zitten, automatisch uitgevoerd kunnen worden.
De scripts met de commandos in staan onder web-backend/nomad/script.sh en web-baackend-2/nomad/script.sh

## 2nd install
Om een tweede server op te zetten worden dezelfde stappen gevolgd als het eerste, maar word het script install-2nd-server.sh gerunt.
Deze zal de 2e back end runnen (web-backend-2), en dan kan deze zijn ip address in de array in de file /web-frontend/src/views/AddMachine.vue gezet worden.
Indien u dit op meer dan 2 servers wilt deployen pakt u het beste de web-backend-2 en past u hier een paar dingen in aan en runned u dit op de nieuwe servers. Er zullen ook nog aanpassingen gedaan moeten worden in de frontend om zo alle virtuele machines van elke server dan te krijgen, dit vind u bij dezelfde files als waar de harcoded IP adressen staan.

## Vlan's voor de vm's
Zorg ervoor de de VLAN functionaliteit op de router werkt en aanstaat.

Hierna zal u in het script, dat u kan vinden onder de web-backend/nomad, de naam van de fysieke poort moeten aanpassen naar die van uw systeem. Op het moment staat die op em0.
