<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.io.BufferedReader" %>
<%@ page import = "java.io.InputStreamReader" %>


<%
    Process proc = Runtime.getRuntime().exec("python C:\\Python39\\test.py");
    BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));  
    String line;  
    while ((line = in.readLine()) != null) {  
        out.println(line);  
    }  
    in.close();      
    proc.waitFor();   
    out.println("end");
%>