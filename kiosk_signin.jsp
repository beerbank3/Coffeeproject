<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
    <head>
        <title>지문 로그인 화면</title>
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
			.company-name {
               margin-left: 20px;
			font-weight: bold;
			font-size: 30px;
			}
			.voice {
                text-align: left;
                font-size: 1.5rem;
                margin-top: 90px;
				margin-left: 40px;
				font-weight: bold;
				text-color: red;
				text-align: center;
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
		<div class = "voice">안내 :<span id="question2"></span></div>
		<script>
			var question = document.querySelector('#question');
			var link = 'http://localhost:8080/kiosk_main.jsp';
			question.textContent = " 전화번호가 식별 되었습니다.";
			question2.textContent = ' 다음으로 검지 손가락을 올려 주세요.';
            /* setTimeout(function() {
				location.href = link;
            }, 3000); */  
		</script>
	</body>
</html>