//bin/express.js

const express = require('express');

module.exports = function () {
    var app =express();

    //On ajoute jade a express ainsi que le chemin des vues
    app.set('view engine', 'jade');
    app.set('views', './public/views');

    //on definit des alias sur nos assets
    app.use('/css', express.static('./public/css'));
    app.use('/js', express.static('./public/js'));
    app.use('/img', express.static('./public/img'));

    return app;
}