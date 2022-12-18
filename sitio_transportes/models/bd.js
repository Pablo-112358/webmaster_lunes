var mysql = require('mysql2');
var util = require('util');

var pool = mysql.createPool({
    connectionLimit: 10,
    // host: 'localhost',
    // user: 'root',
    // password: 'pablo',
    // database: 'ejercicio'
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DB_NAME,
    //insecureAuth: true
});

pool.query = util.promisify(pool.query);

module.exports = pool;
