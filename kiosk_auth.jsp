<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
    <head>
        <title>회원 주문 화면</title>
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
			.voice {
                text-align: left;
                font-size: 1.5rem;
                margin-top: 60px;
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
        <div class = "voice">안내 :<span id="question"></span></div>
        <div class = "voice">음성 :<span id="message"></span></div>
        <div class = "voice">전화번호 :<span id="numbermessage"></span></div>
		<div class = "voice2">안내 :<span id="question2"></span></div>
        <script>
            var question = document.querySelector('#question');
            var message = document.querySelector('#message');
            question.textContent=" 전화번호 뒷자리를 말해주세요."
			question2.textContent=" 이전으로 돌아가려면 '메인'이라고 말씀해주세요."
            var command;
            var command2;
            var link = 'http://localhost:8080/kiosk_auth.jsp';
			var link2 = 'http://localhost:8080/kiosk_main.jsp';
			var link3 = 'http://localhost:8080/kiosk_DB2.jsp';

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

            setTimeout(function() {
                recognition.start();
            }, 1000);

            recognition.onresult = function(event) {
                var last = event.results.length - 1;
                command = event.results[last][0].transcript;
                message.textContent = " " + command;

                numbermessage.textContent = " " + command;
                question.textContent=" 전화번호가 맞습니까? (네 or 아니오)";
                setTimeout(function() {
                    recognition2.start();
                }, 1000);
                if (command == '네') {
					numbermessage.textContent = " " + command2;
                    command.replace(/(\s*)/g,"");
                    location.href = link3+"?cellphone="+command;
                }else if (command == '아니오') {
                    location.href = link;
                }
				if (command == '메인') {
					location.href = link2;
				}
            }
			
			recognition2.onresult = function(event) {
            var last2 = event.results.length - 1;
            command2 = event.results[last2][0].transcript;
            if (command2 == '네') {
                    command2 ='네';
                    check=2;
                    numbermessage.textContent = " " + command2;
                    command.replace(/(\s*)/g,"");
                    location.href=location.href = link3+"?cellphone="+command;
            }else if (command2 == '아니오') {
                   location.href = link;
            }
                numbermessage.textContent = " " + command;
			if (command == '메인') {
					location.href = link2;
			}				
			};
            recognition.onspeechend = function() {
                recognition.stop();
            };
    
            recognition.onerror = function() {
                message.textContent = ' 인식 에러: ' + event.error;
            }</script>

          <!-- Bootstrap core JS-->
          <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
          <!-- Third party plugin JS-->
          <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
          <!-- Contact form JS-->
          <script src="assets/mail/jqBootstrapValidation.js"></script>
          <script src="assets/mail/contact_me.js"></script>
          <!-- Core theme JS-->
        </body>
          </html>