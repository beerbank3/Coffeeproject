<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String content=request.getParameter("content");
	String price =request.getParameter("price");
	int Price = Integer.parseInt(price);
	String num =request.getParameter("num");
	int Num = Integer.parseInt(num);
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try {
			Context init = new InitialContext();
			DataSource ds = 
				(DataSource) init.lookup("java:comp/env/jdbc/MySQLDB");
			conn = ds.getConnection();
			
			pstmt=conn.prepareStatement("UPDATE menu set content = ?,price = ? WHERE num = ?");
			pstmt.setString(1,content);
			pstmt.setInt(2,Price);
			pstmt.setInt(3,Num);
			pstmt.executeUpdate();
			
			out.println("<script>");
			out.println("location.href='menu_check.jsp'");
			out.println("</script>");
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
