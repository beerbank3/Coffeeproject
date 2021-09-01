<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
			
			pstmt=conn.prepareStatement("SELECT * FROM Orderlist where DATE(Ordertime) = DATE(now()) AND Ordercheck='처리완료';");
			rs=pstmt.executeQuery();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<html>
<head>
		<title>Verti by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/cardlist.css" />

<script language='javascript'>
window.setTimeout('window.location.reload()',30000);
</script>
<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/container.css" />
</head>
<body class="is-preload no-sidebar">
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header-wrapper">
					<header id="header" class="container">

						<!-- Logo -->
							<div id="logo">
								<h1><a href="main.jsp">CoffeeHouse</a></h1>
							</div>

						<!-- Nav -->
							<nav id="nav">
								<ul>
									<li><a href="main.jsp">MAIN</a></li>
									<li><a href="menu.jsp">MENU</a></li>
									<li><a href="cup.jsp">RECIPE</a></li>
									<li><a href="board.jsp">BOARD</a></li>
									<li><a href="admin.jsp">ADMIN</a></li>
								</ul>
							</nav>

					</header>
				</div>

			<!-- Main -->
			<div class="card-list">
			<button id="Orderlist">주문내역</button>
			<button id="Ordercomplete">처리완료</button>
			<button style ="margin-right: 200px"id="menuchange">메뉴수정</button>
			
  <div class="cards">
  <% while(rs.next()){%>
  <div class ="card -ochre">
  <div class ="menu">
	<img class ="image"src="assets/img/portfolio/<%=rs.getString("menu") %>.jpg" width = "200px" height="200px"/>
      <h5>주문번호:<%=rs.getString("num") %></h5>
	  <h5>메뉴:<%=rs.getString("menu") %></h5>
	  <h5>수량:<%=rs.getString("count") %></h5>
	  <h5>가격:<%=rs.getString("price") %></h5>
	  <h5>주문처리:<%=rs.getString("Ordercheck")%></h5><h5>주문시간:<%=rs.getString("Ordertime") %></h5>
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
  </div>
</div>
        </div>
    </div>

		<!-- Scripts -->

			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			<script src="assets/js/Orderlist.js"></script>

	</body>
</html>
