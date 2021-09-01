<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	String num=request.getParameter("num");
	int Num = Integer.parseInt(num);
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try {
			Context init = new InitialContext();
			DataSource ds = 
				(DataSource) init.lookup("java:comp/env/jdbc/MySQLDB");
			conn = ds.getConnection();
			
			pstmt=conn.prepareStatement("UPDATE Orderlist set Ordercheck = '처리완료' WHERE num = ?");
			pstmt.setInt(1,Num);
			pstmt.executeUpdate();
			
			out.println("<script>");
			out.println("location.href='member_list.jsp'");
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
