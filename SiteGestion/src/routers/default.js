//src/routers/default.js

const controller = require('./../controllers/default');

module.exports = function(router) { 
    //on injecte le routeur express, pour definir les routes
    //on crée la route pour "/"
    router.get('/', controller.index);
};