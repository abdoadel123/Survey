<%-- 
    Document   : register
    Created on : Dec 17, 2017, 2:57:28 PM
    Author     : hamza
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.awt.Label"%>
<%@page import="javafx.application.Application"%>
<%@page import="DataBase.DBConnection;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>    
    <%
        String username=request.getParameter("username");        
        String password=request.getParameter("password");
        String firstname=request.getParameter("firstname");
        String lastname=request.getParameter("lastname");
        String email=request.getParameter("email");
        System.out.println(username+"   "+password+"   "+firstname+"   "+lastname+"   "+email);
        DBConnection conn = new DBConnection();
        conn.Connectiontomysql();
        conn.statement = (PreparedStatement) conn.connection.prepareStatement("insert into user(userName,password,name,mail,type,state) VALUES (?, ?, ?, ?, ?, ?)");
            conn.statement.setString(1,username);
            conn.statement.setString(2,password);
            conn.statement.setString(3,firstname+" "+lastname);
            conn.statement.setString(4, email);
            conn.statement.setInt(5,2);            
            conn.statement.setInt(6,1);            
            conn.statement.executeUpdate();
            conn.statement.close();
            conn.connection.close();
            response.sendRedirect("logIn.html");
            
    %>

</html>
