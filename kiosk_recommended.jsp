<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try {
			Context init = new InitialContext();
			DataSource ds = 
				(DataSource) init.lookup("java:comp/env/jdbc/MySQLDB");
			conn = ds.getConnection();
			
			pstmt=conn.prepareStatement("SELECT * FROM menu order by RAND() limit 3;");
			rs=pstmt.executeQuery();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>메뉴 추천 화면</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <link rel="stylesheet" href="assets/css/menulist.css" />
		<link rel="stylesheet" href="assets/css/cardlist.css" />
		<style>
			.nav {
            height: 70px;
                border-bottom: 1px solid black;
                display: flex;
                align-items: center;
            }
			.nav-right-items {
                display: flex;
                margin-left: auto;
            }

            .nav-item {
                margin-left: 10px;
            }
			.company-name {
               margin-left: 20px;
				font-weight: bold;
				font-size: 30px;
			}
			.voice {
                text-align: left;
                font-size: 1.5rem;
                margin-top: 30px;
				font-weight: bold;
				text-align: center;
            }
			.voice2 {
				margin-top: 500px;
				text-align: center;
				font-weight: bold;
				font-size: 24px;
			}			
		</style>
    </head>
    <body>
	<div class="nav">
			<div class="company-name">
				CoffeeHouse
			</div>
			<div class="nav-right-items">
				<div class="nav-item">화면 로딩 후, 1~2초 뒤 음성을 인식합니다.</div>
				<div class="nav-item"></div>
				<div class="nav-item"></div>
				<div class="nav-item"></div>
			</div>
		</div>
	<%while(rs.next()){%>	
		<div class ="card -ochre">
			<div class ="menu">
				<img class ="image"src="assets/img/portfolio/<%=rs.getString("name") %>.jpg" width = "200px" height="200px"/>
				<h2>추천메뉴는 <%=rs.getString("name") %> 입니다.</h2>
			</div>
		</div>
				<%}
			try{
				pstmt.close();
				conn.close();
			}
			catch(Exception e){
				e.printStackTrace();
			}
			%>
        <div class = "voice">안내 :<span id="question"></span></div>
        <div class = "voice">음성 :<span id="message"></span></div>
        <div class = "voice">수량 :<span id="numbermessage"></span></div>
		<div class = "voice">안내 :<span id="question2"></span></div>
        <script>
            const myAudio = new Audio();
			myAudio.src = "assets/audio/hello.wav";
			var check=0;
			var price;
			var command;
			var command2;
			var link2 = 'http://localhost:8080/kiosk_main.jsp';
			var question = document.querySelector('#question');
			var message = document.querySelector('#message');
			var menumessage = document.querySelector('#menumessage');
			question.textContent=" 메뉴를 말씀해주세요."
			question2.textContent=" 이전으로 돌아가려면 '메인'이라고 말씀해주세요."
			var SpeechRecognition = SpeechRecognition || webkitSpeechRecognition;
			var SpeechGrammarList = SpeechGrammarList || webkitSpeechGrammarList;
	
			var grammer = '#JSGF V1.0;';
	
			// recognition는 메뉴선택, recognition2는 수량선택
			
			var recognition = new SpeechRecognition();
			var recognition2 = new SpeechRecognition();
			
			var speechRecognitionGrammerList = new SpeechGrammarList();
			speechRecognitionGrammerList.addFromString(grammer, 1);
	
			recognition.grammer = speechRecognitionGrammerList;
			recognition.lang = 'KO-kr';
			recognition.interimResults = false;
			
			recognition2.grammer = speechRecognitionGrammerList;
			recognition2.lang = 'KO-kr';
			recognition2.interimResults = false;
			myAudio.play();
			setTimeout(function() {
				recognition.start();
			}, 2000);

			recognition.onresult = function(event) {
				var last = event.results.length - 1;
				command = event.results[last][0].transcript;
				message.textContent = " " + command;
				if (command == '아메리카노') {
					command ='바닐라 크림 콜드 브루-Vanilla Cream Cold Brew';
					check=1;
				}else if (command == '메인') {
					location.href = link2;
				}
				else if(command == '바닐라') {
					command ='바닐라 크림 콜드 브루-Vanilla Cream Cold Brew';
					check=1;
				}else if(command == '바닐라 크림 콜드 브루') {
					command ='바닐라 크림 콜드 브루-Vanilla Cream Cold Brew';
					check=1;
				}else if( command == '아메리카노.') {
					command ='바닐라 크림 콜드 브루-Vanilla Cream Cold Brew';
					check=1;
				}else{
					if(check==0){
						question.textContent=" 메뉴를 정확히 말씀해주세요.";
						menumessage.textContent=" 다시말씀해주세요.";
						setTimeout(function() {
						recognition.start();
					}, 1000);
					}	
				}
				if(check==1){
					menumessage.textContent = " " + command;
				question.textContent=" 수량를 말씀해주세요.";
				setTimeout(function() {
					recognition2.start();
				}, 1000);
				
				}
			};
			recognition2.onresult = function(event) {
            var last2 = event.results.length - 1;
            command2 = event.results[last2][0].transcript;
			if (command2 == '세계.') {
				command2 ='3';
			}
			else if (command == '메인') {
				location.href = link2;
			}
			numbermessage.textContent = " " + command2;
			location.href="DB.jsp?menu="+command+"&count="+command2+"&price=5000";
			};
	
			recognition.onspeechend = function() {
				recognition.stop();
			};
	
			recognition.onerror = function() {
				message.textContent = ' 인식 에러: ' + event.error;
			}</script>

        </body>
          </html>