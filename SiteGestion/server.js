// Création des variables de bases.
const express = require('express');
const app = express();
const path = require('path');
const port = 8080;

// base de données
const mysql = require('mysql');
const connection = require('./lib/db');

// auth
const cookieParser = require('cookie-parser');
const createError = require('http-errors');
const logger = require('morgan');
const expressValidator = require('express-validator');
const flash = require('express-flash');
const session = require('express-session');

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

//routes
var indexRouter = require('./routes/index');
var authRouter = require('./routes/auth');
var aboutRouter = require('./routes/about');

// Utilisation de l'app
app.use('/', indexRouter);
app.use('/auth', authRouter);
app.use('/about', aboutRouter);

app.listen(port, () => {
    console.log('LOGGED');
});