// connection à la base de données qui existe pas encore

const { error } = require('console');
const mysql = require('mysql');

const connection = mysql.createConnection({
    host:'10.1.1.100',
    user:'toto',
    password:'toto',
    database:'utilisateurs',
});

connection.connect((error) => {
    if(!!error) {
        console.log(error);
    }else {
        console.log('Connected');
    }
});

module.exports = connection;