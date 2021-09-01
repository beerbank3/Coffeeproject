<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	Connection conn=null;
	
	String driver="com.mysql.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/micom";
	String cellphone=request.getParameter("cellphone");	
	
	Boolean connect=false;
	
	
	PreparedStatement pstmt=null;
	
	
	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url,"root","root");

		pstmt=conn.prepareStatement("INSERT INTO fingerprint VALUES (?)");
		pstmt.setString(1,cellphone);
  		int result=pstmt.executeUpdate();
			
		
		if(result!=0){  
			out.println("<script>");
			out.println("location.href='kiosk_fingerprint.jsp'");
  		  	out.println("</script>");
		}
		conn.close();
		
	}catch(Exception e){
		connect=false;
		e.printStackTrace();
	}
%>
<html>
<head>
<title>JDBC 연동</title>
</head>
<body>
<h3>
왜안되노
</h3>
</body>
</html>