// Création des variables de bases.
const express = require('express');
const app = express();
const path = require('path');
const port = 8080;

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

//routes
var indexRouter = require('./routes/index');

app.use('/', indexRouter);

app.listen(port, () => {
    console.log('LOGGED');
});