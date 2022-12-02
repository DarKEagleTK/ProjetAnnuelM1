//src/controllers/default.js

module.exports.index = function(req, res) {

    //req = objet requete
    //res = objet reponse
    //res rends l'objet index.jade
    res.render('index');
};