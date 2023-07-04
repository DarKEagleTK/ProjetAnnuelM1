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
        // utilisateur non existant
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

//dashboard
router.get('/dashboard', (req,res,next) => {
    const name = req.session.name;
    //query pour recupérer les données
    connection.query('SELECT * FROM users INNER JOIN services ON users.id = services.id WHERE users.name = ?;', [name], (err, row, fields) => {
        if (err) throw err;

        const nbr_email = row[0].mail;
        const nbr_domain = row[0].domain;
        const nbr_site = row[0].site;
        const nbr_vps = row[0].vps;

        if (nbr_email != null) {
            nbr_email == 0;
        }
        if (nbr_domain != null) {
            nbr_domain == 0;
        }
        if (nbr_site != null) {
            nbr_site == 0;
        }
        if (nbr_vps != null) {
            nbr_vps == 0;
        }
        connection.query('SELECT vps.id, vps.name FROM users INNER JOIN vps ON users.id = vps.id_user WHERE users.name = ?;', [name], (err, row, fields) => {
            if (err) throw err;
            const list_vps = [];
            for(i=0; i<row.length; i++) {
                list_vps.push(row[i].name);
            };
            connection.query('SELECT domain.id, domain.domain FROM users INNER JOIN domain ON users.id = domain.id_user WHERE users.name = ?;', [name], (err, row, fields) => {
                if (err) throw err;
                const list_domain = [];
                for(i=0; i<row.length; i++) {
                    list_domain.push(row[i].domain);
                };
                connection.query('SELECT site.id, site.site FROM users INNER JOIN site ON users.id = site.id_user WHERE users.name = ?;', [name], (err, row, fields) => {
                    if (err) throw err;
                    const list_site = [];
                    for(i=0; i<row.length; i++) {
                        list_site.push(row[i].site);
                    };
                    connection.query('SELECT mail.id, mail.mail FROM users INNER JOIN mail ON users.id = mail.id_user WHERE users.name = ?;', [name], (err, row, fields) => {
                        if (err) throw err;
                        const list_mail = [];
                        for(i=0; i<row.length; i++) {
                            list_mail.push(row[i].mail);
                        };
                        if (req.session.loggedin) {
                            res.render('auth/dashboard', {
                                title: "Dashboard",
                                name: req.session.name,
                                nbr_domain: nbr_domain,
                                nbr_email: nbr_email,
                                nbr_site: nbr_site,
                                nbr_vps: nbr_vps,
                                list_domain: list_domain,
                                list_site: list_site,
                                list_mail: list_mail,
                                list_vps: list_vps
                            });
                        } else {
                            req.flash('error', 'please login first');
                            res.redirect('/auth/login');
                        }
                    });
                });
            });
        });
    });
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

//gestions service
router.get('/service', (req,res,next) => {
    const service = req.body.service;
    const nom = req.body.nom;

    if (req.session.loggedin) {
        res.redirect('auth/service', {
            title: "Service",
            name: req.session.name,
            service: service,
            nom: nom
        });
    } else {
        req.flash('error', 'please login first');
        res.redirect('/auth/login');
    }
});
module.exports = router;
