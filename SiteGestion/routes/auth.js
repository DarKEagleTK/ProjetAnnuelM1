// Création des variables de bases.
const express = require('express');
const router = express.Router();
const connection = require('../lib/db');

// display login page
router.get('/login', (req,res,next) => {
    res.render('auth/login', {
        title: 'Login',
        email: '',
        password: ''
    });
});

// authentifier utilisateur
router.post('/authentication', (req,res,next) => {
    const email = req.body.email;
    const password = req.body.password;

    connection.query('SELECT * FROM users WHERE email = ? AND password = ?', [email, password], (err, row, fields) => {
        if (err) throw err;
        // utilisateru non existant
        if (row.length <= 0) {
            req.flash('error', 'please enter correct email and password');
            res.redirect('/auth/login');
        }
        else {
            req.session.loggedin = true;
            req.session.name = row[0].name;
            res.redirect('/auth/home');
        };
    });
});

// display home page 
router.get('/home', (req, res, next) => {
    if (req.session.loggedin) {
        res.render('auth/index_connected', {
            title: "Home",
            name: req.session.name
        });
    }
    else {
        req.flash('error', 'please login first');
        res.redirect('/auth/login');
    }
});

//logout
router.get('/logout', (req,res) => {
    req.session.destroy();
    res.redirect('/auth/login');
});

//achat
router.get('/achat', (req,res,next) => {
    if (req.session.loggedin) {
        res.render('auth/achat', {
            title: "Achat",
            name: req.session.name
        });
    } else {
        req.flash('error', 'please login first');
        res.redirect('/auth/login');
    }
});

module.exports = router;
