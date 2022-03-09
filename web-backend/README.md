Backend Documentatie
==============

# Installatie & Opstarten

install server
```cs
npm install
```

run
```cs
npm run server.js
```

------------------------

# Uitleg

## Bij elke methode staat er normaal gezien een comment met wat de methode doet
```cs
web-backend/routes/RoutingEndpoint.js stuurt de CRUD methodes naar web-backend/server.js 
```

## Poort aanpassen van de backend
### Nu staat de server op poort op 3000. Dit kan je veranderen in web-backend/server.js 
```cs
const port = process.env.PORT || 3000;
```

## CORS
### Iedereen kent de cors erros wel, daarom staat er nu dat CORS op elke origin mag, voor de veiligheid te garanderen kan je het * veranderen naar de URL's die wel betrouwbaar zijn. Dit kan je veranderen in web-backend/server.js 
```cs
app.use(cors({origin: '*'}));
```

------------------------

