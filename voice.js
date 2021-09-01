var command = "아이스 돌체 라떼-Iced Dolce Latte";
var mysql = require('mysql');  // mysql 모듈 로드
var conn = {  // mysql 접속 설정
    host: 'localhost',
    port: '3306',
    user: 'root',
    password: 'root',
    database: 'micom'
};
var connection = mysql.createConnection(conn); // DB 커넥션 생성
connection.connect();   // DB 접속
 
var testQuery = "SELECT price from menu where name='"+command+"';";
 
connection.query(testQuery, function (err, results, fields) { // testQuery 실행
    if (err) {
        console.log(err);
    }
    console.log(results);
});
 
connection.end();