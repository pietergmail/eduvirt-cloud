const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const RoutingEndpoint = require('./routes/RoutingEndpoint');

const app = express();
const port = process.env.PORT || 3000;

app.use(bodyParser.json());
app.use(cors());

app.listen(port, () => console.log(`Server running on port ${port}`));


// CRUD
app.get('/users', RoutingEndpoint.getUsers);
app.get('/courses', RoutingEndpoint.getCourses);
app.get('/templates', RoutingEndpoint.getTemplates);
app.post('/getUser', RoutingEndpoint.getUserWithUsername);
app.post('/createMachine', RoutingEndpoint.createMachine);


// auth CRUD
app.post('/loginUser', RoutingEndpoint.loginUser);