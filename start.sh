 #!/bin/sh

 cd web-backend
 npm install
 node server.js

 cd ..
 cd web-frontend
 npm install
 npm run serve
