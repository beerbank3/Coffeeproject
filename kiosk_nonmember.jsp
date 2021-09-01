<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	String menu[] = new String[22];
	String price[] = new String[22];
	int i=0;
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try {
			Context init = new InitialContext();
			DataSource ds = 
				(DataSource) init.lookup("java:comp/env/jdbc/MySQLDB");
			conn = ds.getConnection();
			
			pstmt=conn.prepareStatement("SELECT * FROM menu;");
			rs=pstmt.executeQuery();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>비회원 주문 화면</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />	
		<link rel="stylesheet" href="assets/css/menulist.css" />
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
			
		</style>
	</head>
	<body>
		<div class="nav">
			<div class="company-name">
				CoffeeHouse
			</div>
			<div class = "voice">안내 :<span id="question"></span></div>
			<div class = "voice">답변 :<span id="message"></span></div>
			<div class="nav-right-items">
				<div class="nav-item">화면 로딩 후, 1~2초 뒤 음성을 인식합니다.</div>
			</div>
		</div>
		<script>
			var check=0;
			var price;
			var command;
			var command2;
		var question = document.querySelector('#question');
		var message = document.querySelector('#message');
		var menumessage = document.querySelector('#menumessage');
		question.textContent=" 메뉴 이름을 말씀해주세요. (하나만)"
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

			setTimeout(function() {
				recognition.start();
			}, 1500);

			recognition.onresult = function(event) {
				var last = event.results.length - 1;
				command = event.results[last][0].transcript;
				message.textContent = " " + command;
				if (command == '아메리카노') {
					command ='바닐라 크림 콜드 브루-Vanilla Cream Cold Brew';
					check=1;
				}else if(command == '바닐라') {
					command ='바닐라 크림 콜드 브루-Vanilla Cream Cold Brew';
					check=1;
				}else if(command == '아이스.') {
					command ='아이스 돌체 라떼-Iced Dolce Latte';
					check=1;
				}else if( command == '아메리카노.') {
					command ='바닐라 크림 콜드 브루-Vanilla Cream Cold Brew';
					check=1;
				}else{
					if(check==0){
						question.textContent=" 메뉴를 정확히 말씀해주세요.";
						menumessage.textContent=" 다시 말씀해주세요.";
						setTimeout(function() {
						recognition.start();
						}, 1000);
					}	
				}
				if(check==1){
					location.href="kiosk_nonmemberOrder.jsp?menu="+command;
				}
			};
			recognition.onspeechend = function() {
				recognition.stop();
			};
	
			recognition.onerror = function() {
				message.textContent = ' 인식 에러: ' + event.error;
			}</script>
<ul class="cards">
	<% while(rs.next()){%>
	<li>
	  <a href="" class="card">
		<img src="assets/img/portfolio/<%=rs.getString("name")%>.jpg" class="card__image" alt="" />            
			<div class="card__header-text">
			  <h1 class="card__title"><%=rs.getString("name")%></h1>            
			  <span class="card__status"><%=rs.getString("price")%></span>
			</div>
	  </a>      
	</li>
	<%}
	try{
 			pstmt.close();
 			conn.close();
 		}
 		catch(Exception e){
 			e.printStackTrace();
 		}
		%>
  </ul>
		</body>
		  </html>