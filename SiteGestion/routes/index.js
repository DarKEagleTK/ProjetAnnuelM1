const express = require('express');
const { Module } = require('module');
const router = express.Router();

router.get('/', (req, res, next) => {
    res.render('index', {title: 'EXPRESS'});
});

module.exports = router;