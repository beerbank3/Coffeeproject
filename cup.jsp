<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  		<title>나만의 레시피</title>
		<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/cup.css">

</head>
<body>
						<!-- Logo -->
							<div id="logo">
								<h1>CoffeeHouse</h1>
							</div>

						<!-- Nav -->
							<nav id="nav">
								<ul>
									<li><a href="main.jsp">MAIN</a></li>
									<li><a href="menu.jsp">MENU</a></li>
									<li class="current"><a href="recipe.jsp">RECIPE</a></li>
									<li><a href="board.jsp">BOARD</a></li>
									<li><a href="admin.jsp">ADMIN</a></li>
								</ul>
							</nav>


<!-- partial:index.partial.html -->
<div class="options">
  <button id="americano" onClick="reply_click(this.id)">Americano</button>
  <button id="au_lait" onClick="reply_click(this.id)">Au lait</button>
  <button id="capuccino" onClick="reply_click(this.id)">Capuccino</button>
  <button id="corretto" onClick="reply_click(this.id)">Corretto</button>
  <button id="espresso" onClick="reply_click(this.id)">Espresso</button>
  <button id="latte" onClick="reply_click(this.id)">Latte</button>
  <button id="lungo" onClick="reply_click(this.id)">Lungo</button>
  <button id="macchiato" onClick="reply_click(this.id)">Macchiato</button>
  <button id="mocha" onClick="reply_click(this.id)">Mocha</button>
  <button id="ristretto" onClick="reply_click(this.id)">Ristretto</button>
</div>
<div class="container">
  <h1 class="coffee_name">Choose your coffee</h1>
  <div class="cup">
    <div class="filling reset">
      <div class="coffee">Coffee</div>
      <div class="water">Water</div>
      <div class="liquor">Liquor</div>
      <div class="milk">Milk</div>
      <div class="whipped_cream">Whipped cream</div>
      <div class="milk_foam">Milk foam</div>
      <div class="steamed_milk">Steamed milk</div>
      <div class="chocolate">Chocolate</div>
    </div>
    <div class="plate"></div>
  </div>
</div>
<!-- partial -->

  <div class ="options">
  <button id="coffee" onClick="reply_click(this.id)">coffee</button>
    <button id="Choco" onClick="reply_click(this.id)">Choco</button>
	<button id="Steamed milk" onClick="reply_click(this.id)">Steamed milk</button>
	<button id="Milk foam" onClick="reply_click(this.id)">Milk foam</button>
	<button id="Whipped cream" onClick="reply_click(this.id)">Whipped cream</button>
    <button id="Liquor" onClick="reply_click(this.id)">Liquor</button>
    <button id="Milk" onClick="reply_click(this.id)">Milk</button>
	<button id="Water" onClick="reply_click(this.id)">Water</button>
	<button id="Reset" onClick="reply_click(this.id)">초기화</button>
  </div>
  <!-- Scripts -->
  <script  src="assets/js/cup.js"></script>
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/js/jquery.dropotron.min.js"></script>
  <script src="assets/js/browser.min.js"></script>
  <script src="assets/js/breakpoints.min.js"></script>
  <script src="assets/js/util.js"></script>
  <script src="assets/js/main.js"></script>
</body>
</html>
