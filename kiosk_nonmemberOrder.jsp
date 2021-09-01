<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
    request.setCharacterEncoding("UTF-8");
	String menu =request.getParameter("menu");
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try {
			Context init = new InitialContext();
			DataSource ds = 
				(DataSource) init.lookup("java:comp/env/jdbc/MySQLDB");
			conn = ds.getConnection();
			
			pstmt=conn.prepareStatement("SELECT * FROM menu where name=?;");
            pstmt.setString(1,menu);
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
		<link rel="stylesheet" href="assets/css/main.css" />
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
        <ui>
            <div id="main-wrapper">
                <div class="container">
        <%if(rs.next()){%>
            <img src="assets/img/portfolio/<%=rs.getString("name")%>.jpg" alt="" /> 
            <h5>메뉴는 <%=rs.getString("name") %> 입니다.</h5>
            <h5>가격은 <%=rs.getString("price") %>원 입니다.</h5>
            <%}
            try{
             pstmt.close();
             conn.close();
            }
         catch(Exception e){
             e.printStackTrace();
         }
            %>

        </ui>
		<script>
			var check=0;
            var menu="<%=menu%>";
			var price;
			var command;
			var command2;
		var question = document.querySelector('#question');
		var message = document.querySelector('#message');
		var menumessage = document.querySelector('#menumessage');
		question.textContent=" 수량을 말씀해주세요."
			var SpeechRecognition = SpeechRecognition || webkitSpeechRecognition;
			var SpeechGrammarList = SpeechGrammarList || webkitSpeechGrammarList;
	
			var grammer = '#JSGF V1.0;';
	
			// recognition는 메뉴선택, recognition2는 수량선택
			
			var recognition2 = new SpeechRecognition();
			
			var speechRecognitionGrammerList = new SpeechGrammarList();
			speechRecognitionGrammerList.addFromString(grammer, 1);

			recognition2.grammer = speechRecognitionGrammerList;
			recognition2.lang = 'KO-kr';
			recognition2.interimResults = false;

			setTimeout(function() {
				recognition2.start();
			}, 1000);

			recognition2.onresult = function(event) {
            var last2 = event.results.length - 1;
            command2 = event.results[last2][0].transcript;
			if (command2 == '세 잔' || command2 == '세잔.' || command2 == '세 개' || command2 == '세개.' || command2 == '세계.'|| command2 == '재개.' || command2 == '다섯 개' || command2 == '3잔.'|| command2 == '3') {
				command2 = '3';
                message.textContent=command2;
				location.href="DB.jsp?menu="+menu+"&count="+command2+"&price=5000";
			}
			else{ 
				question.textContent=" 수량을 정확히 말씀해주세요.";
                message.textContent=command2;
				setTimeout(function() {
				recognition2.start();
				}, 1000);
			}
			};</script>
		</body>
		  </html>