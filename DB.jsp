<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String menu=request.getParameter("menu");	
	String count=request.getParameter("count");
	String price=request.getParameter("price");
	int sum = Integer.parseInt(count)*Integer.parseInt(price);
	String Ordercheck="주문대기";
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try {
		Context init = new InitialContext();
  		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQLDB");
  		conn = ds.getConnection();
		
  		pstmt=conn.prepareStatement("INSERT INTO Orderlist VALUES (?,?,?,?,?,now())");
		pstmt.setInt(1,0);
  		pstmt.setString(2,menu);
  		pstmt.setString(3,count);
  		pstmt.setInt(4,sum);
		pstmt.setString(5,Ordercheck);
  		int result=pstmt.executeUpdate();

  		if(result!=0){  		
  			out.println("<script>");
			out.println("location.href='Order-kiosk.jsp'");
  		  	out.println("</script>");
  		}else{
  			out.println("<script>");
  	  		out.println("location.href='main.jsp'");
  	  		out.println("</script>");	
  		}
	}catch(Exception e){
		e.printStackTrace();
 	}finally{
 		try{
 			pstmt.close();
 			conn.close();
 		}
 		catch(Exception e){
 			e.printStackTrace();
 		}
 	}
%>