// Création des variables de bases.
const express = require('express');
const router = express.Router();
const connection = require('../lib/db');

// login 
router.get('/login', (req,res,next) => {
    res.render('auth/login', {
        title: 'Login',
        email: '',
        password: ''
    });
});

// authentifier utilisateur
router.post('/authentification', (req,res,next) => {
    connection.query('SELECT * FROM users WHERE email = ? AND password = ?', [email, password], (err, row, fields) => {
        if (err) throw err;

        // utilisateru non existant
        if (row.length <= 0) {
            req.flash('error', 'please enter correct auth');
            res.redirect('/login');
        }
        else {
            req.session.loggedin = true;
            req.session.name = name;
            res.redirect('/home');
        };
    });
});

// home page 
router.get('/home', (req, res, next) => {
    if (req.session.loggedin) {
        res.render('auth/home', {
            title: "Dashboad",
            name: req.session.name
        });
    }
    else {
        req.flash('success', 'please login first');
        res.redirect('/login');
    }
});

//logout
router.get('/logout', (req,res) => {
    req.session.destroy();
    req.flash('success', "login again");
    res.redirect('/login');
});

module.exports = router;
