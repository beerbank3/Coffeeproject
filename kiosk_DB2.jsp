<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    String cellphone=request.getParameter("cellphone");

    Connection conn=null;
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    try {
            Context init = new InitialContext();
            DataSource ds = 
                (DataSource) init.lookup("java:comp/env/jdbc/MySQLDB");
            conn = ds.getConnection();

            pstmt=conn.prepareStatement("SELECT * FROM Fingerprint where cellphone=?");
            pstmt.setString(1,cellphone);
              rs=pstmt.executeQuery();

            if(rs.next()){
                if(cellphone.equals(rs.getString("cellphone"))){
                  session.setAttribute("cellphone",cellphone);
                  out.println("<script>");
                  out.println("location.href='kiosk_signin.jsp'");
                  out.println("</script>");
				}
            }
            else {
                out.println("<script>");
                out.println("location.href='kiosk_auth.jsp'");
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