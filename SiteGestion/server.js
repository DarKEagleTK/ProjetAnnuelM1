//server.js 
// Nous avons besoin de notre configuration

const app = require('./bin/express')(); 
const router = require('./bin/express-router')(); 

//On fait appel à nos routes 
require('./src/routers/default')(router); 

// Puis on dit à express d'utiliser notre router 
app.use('/', router); 

// Enfin on lance notre serveur sur le port 8080 
app.listen(8080);
console.log('Server launched on port 8080');