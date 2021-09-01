<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width">
        <title>키오스크 메인 화면</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
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

            .title {
                text-align: center;
                font-size: 3.5rem;
                font-weight: bold;
            }

            .subtitle {
                text-align: center;
                font-size: 1.25rem;
                font-weight: 300;
            }

            .main {
                width: 1000px;
                margin: 0 auto;
                margin-top: 60px;
            }

            .prices {
                display: flex;
            }

            .prices-item {
                width: 300px;
                height: 350px;
                border: 1px solid black;
                margin: 20px;
                border-radius: 4px;
                text-align: center;
            }

            .prices-item-title {
                font-size: 1.5rem;
                background: rgba(0, 0, 0, .03);
                text-align: center;
                height: 53px;
                line-height: 53px;
                border-bottom: 1px solid black;
            }

            .prices-item-price {
                font-size: 2.5rem;
                font-weight: bold;
                padding: 20px;
                text-align: center;
            }

            .prices-item-button {
                padding: .5rem 1rem;
                font-size: 1.25rem;
                line-height: 1.5;
                border-radius: .3rem;
                color: #007bff;
                background-color: transparent;
                background-image: none;
                border-color: 007bff;
                margin-top: 30px;
            }

            .prices-item-button--actice {
                background-color: #007bff;
                color: white;
            }
            
            .prices-item-detail {
                text-align: center;
            }

            .voice {
                text-align: center;
                font-size: 1.5rem;
                font-weight: 300;
                margin-top: 20px;
				font-weight: bold;
				text-color: red;
            }
			
			.prices-item-detail-detail {
				font-weight: bold;
				color: red;
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
        <div class="main">
            <div class="title">
                스마트 키오스크
            </div>
            <div class="subtitle">
                음성으로 주문하는 비접촉 키오스크
            </div>
            <div class="prices">
                <div class="prices-item">
                    <div class="prices-item-title">
                        1
                    </div>
                    <div class="prices-item-price">
                        회원주문
                    </div>
                    <div class="prices-item-detail prices-item-detail-detail">
                        '회원주문' 이라고 말씀해주세요.
                    </div>
                    <div class="prices-item-detail">
                        전화번호와 지문으로 인증
                    </div>
                    <div class="prices-item-detail">
                        몰라몰라
                    </div>
                    <div class="prices-item-detail">
                        클릭도 가능
                    </div>
                    <button class="prices-item-button prices-item-button--actice" onclick="location.href='kiosk_auth.jsp'">
                        회원주문(클릭)
                    </button>
                </div>

                <div class="prices-item">
                    <div class="prices-item-title">
                        2
                    </div>
                    <div class="prices-item-price">
                        비회원주문
                    </div>
                    <div class="prices-item-detail prices-item-detail-detail">
                        '비회원주문' 이라고 말씀해주세요.
                    </div>
                    <div class="prices-item-detail">
                        인증 없이 간편하게 바로 주문
                    </div>
                    <div class="prices-item-detail">
                        몰라몰라
                    </div>
                    <div class="prices-item-detail">
                        클릭도 가능
                    </div>
                    <button class="prices-item-button prices-item-button--actice" onclick="location.href='kiosk_nonmember.jsp'">
                        비회원주문(클릭)
                    </button>
                </div>
            </div>
        </div>
        <div class = "voice">안내 :<span id="question"></span></div>
        <div class = "voice">음성 :<span id="message"></span></div>
		<div class = "voice"><br><br>안내 :<span id="question2"></span></div>
        <script>
			var question = document.querySelector('#question');
            var message = document.querySelector('#message');
            question.textContent=" 주문 방식을 선택 해주세요."
			question2.textContent=" 음성을 잘 못 인식했을 경우, 2초후 다시 말씀해주세요."
            var command;
            var command2;
            var link = 'http://localhost:8080/kiosk_auth.jsp';
			var link2 = 'http://localhost:8080/kiosk_nonmember.jsp';
			var link3 = 'http://localhost:8080/kiosk_signup.jsp';
			var link4 = 'http://localhost:8080/kiosk_main.jsp';

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

                if (command == '회원 주문.') {
					question.textContent = ' 3초후 이동합니다.';
                    setTimeout(function() {
						location.href = link;
                    }, 3000);                 
                }
				else if (command == '비회원 주문.') {
					question.textContent = ' 3초후 이동합니다.';
                    setTimeout(function() {
						location.href = link2;
                    }, 3000);                 
                }
				else if (command == '사용자 등록.') {
					question.textContent = ' 3초후 이동합니다.';
                    setTimeout(function() {
						location.href = link3;
                    }, 3000);                 
                }
				else {
					question.textContent = ' 다시 말씀해주세요.';
					setTimeout(function() {
					recognition.start();
					}, 2000); 
				}
            }
			recognition.onerror = function() {
                message.textContent = ' 음성을 식별 하지 못했습니다. ' + event.error;
            }
        </script>
    </body>
</html>