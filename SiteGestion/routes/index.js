const express = require('express');
const router = express.Router();

router.get('/', (req, res, next) => {
    res.render('index', {title: 'Team Grosse Tete'});
});

module.exports = router;