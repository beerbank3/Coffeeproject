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
			
			pstmt=conn.prepareStatement("select * from orderlist order by Ordertime DESC limit 1;");
			rs=pstmt.executeQuery();
	}catch(Exception e){
		e.printStackTrace();
 	}
%>
<!DOCTYPE HTML>
<!--
	Verti by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>CoffeeHouse</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/cardlist.css"/>
	</head>
	<body class="is-preload homepage">
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header-wrapper">
					<header id="header" class="container">

						<!-- Logo -->
							<div id="logo">
								<h1><a href="main.jsp">CoffeeHouse</a></h1>
							</div>

						<!-- Nav -->

					</header>
				</div>
			<!-- Features -->
			<div style="
				background: #fff;
					box-shadow: 0px 3px 0px 0px rgba(0, 0, 0, 0.05);
					padding: 5em 0 10em 0;
			  ">
					<div class="container">
			<%if(rs.next()){%>
				<img class ="image"src="assets/img/portfolio/<%=rs.getString("menu") %>.jpg" width = "300px" height="300px"/>
				<h1>주문번호는 <b style ="color:green";><%=rs.getString("num") %></b> 번 입니다.</h1>
				<h3>메뉴는 <%=rs.getString("menu") %> 입니다.</h3>
				<h3>주문하신 갯수는 <%=rs.getString("count")%> 개 입니다.</h3>
				<h3>총 가격은  <%=rs.getString("price")%> 입니다.</h3>
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
		<!-- Scripts -->

			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>