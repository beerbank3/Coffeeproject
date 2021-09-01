const mysql = require('mysql');  // mysql 모듈 로드
var menu = new Array();
var price = new Array();
const conn = {  // mysql 접속 설정
    host: 'localhost',
    port: '3306',
    user: 'root',
    password: 'root',
    database: 'micom'
};
var connection = mysql.createConnection(conn); // DB 커넥션 생성
connection.connect();   // DB 접속
 
var testQuery = "SELECT name from menu;";
 
connection.query(testQuery, function (err, results, fields) { // testQuery 실행
    if (err) {
        console.log(err);
    }
    menu = results;
    console.log(JSON.stringify(results));
    if("바닐라 크림 콜드 브루-Vanilla Cream Cold Brew"==menu[0]){
        console.log("시발");
    }
    
});
var testQuery = "SELECT price from menu;";
 
connection.query(testQuery, function (err, results, fields) { // testQuery 실행
    if (err) {
        console.log(err);
    }
    price = results
});
connection.end();
