<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	request.setCharacterEncoding("UTF-8");	
    String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try {
			Context init = new InitialContext();
			DataSource ds = 
				(DataSource) init.lookup("java:comp/env/jdbc/MySQLDB");
			conn = ds.getConnection();
			
			pstmt=conn.prepareStatement("SELECT * FROM Login where id='"+id+"'");
			rs=pstmt.executeQuery();
			
			if(id.equals("admin")){  			
  			out.println("<script>");
  		  	out.println("location.href='member_list.jsp'");
  		  	out.println("</script>");
  		}else{
  			out.println("<script>");
  	  		out.println("location.href='admin.jsp'");
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
