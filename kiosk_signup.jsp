<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE HTML>
<html>
    <head>
        <title>사용자 등록 화면</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
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
			
			.voice {
                font-size: 1.5rem;
                margin-top: 30px;
				margin-left: auto;
				font-weight: bold;
            }	
			
			.company-name {
                margin-left: 20px;
				font-weight: bold;
				font-size: 30px;
            }
			
			.voice-detail {
				font-weight: bold;
				color: red;
			}
			
			.prices-item {
                width: 700px;
                height: 340px;
                border: 5px solid gray;
                margin: auto;
				margin-top: 80px;
                border-radius: 40px;
                text-align: center;
            }
			
			.main {
                width: 1000px;
                margin: 0 auto;
                margin-top: 50px;
            }

            .prices {
                display: flex;			
            }
			
			.voice2 {
				margin-top: 300px;
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
		<br><br><br><br>
		<div class="main">
			<div class="prices">
				<div class="prices-item">
					<div class="voice"><br><span id="asd"></span></div>
					<div class="voice">안내 :<span id="question"></span></div>
					<div class="voice">음성 :<span id="message"></span></div>
					<div class="voice">전화번호 :<span id="numbermessage"></span></div>
					<div class="voice2">안내 :<span id="question2"></span></div>
				</div>
			</div>
		</div>
        <script>
            var check=0;
            var price;
            var command;
            var command2;
			var link2 = 'http://localhost:8080/kiosk_main.jsp';
            var question = document.querySelector('#question');
            var message = document.querySelector('#message');
            var numbermessage = document.querySelector('#numbermessage');
            question.textContent=" 전화번호 뒷자리를 말씀해주세요."
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
			
            setTimeout(function() {
                recognition.start();
            }, 4000);

            recognition.onresult = function(event) {
                var last = event.results.length - 1;
                command = event.results[last][0].transcript;
                message.textContent = " " + command;

                numbermessage.textContent = " " + command;
                question.textContent=" 전화번호가 맞습니까? (네 or 아니오)";
				
                setTimeout(function() {
                    recognition2.start();
                }, 1000);    

			if (command == '메인') {
					location.href = link2;
				}				
            };
			
			
            recognition2.onresult = function(event) {
            var last2 = event.results.length - 1;
            command2 = event.results[last2][0].transcript;
            if (command2 == '네') {
                    command2 ='네';
                    check=2;
                    numbermessage.textContent = " " + command2;
                    question.textContent = " 저장되었습니다.";
                    command.replace(/(\s*)/g,"");
                    location.href="kiosk_DB.jsp?cellphone="+command;
            }else if (command2 == '아니오' || command2 == '아니요') {
                    command2 = '아니오';
                    check=0;
                    message.textContent = " " + command2;
                    question.textContent=" 전화번호를 다시 말씀해주세요.";
                    setTimeout(function() {
                    recognition.start();
                }, 1000);
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
                message.textContent = ' 인식 에러 : ' + event.error;
            }
		</script>
        
	</body>
</html>