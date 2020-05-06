<%-- 
    Document   : logCheck
    Created on : Dec 17, 2017, 1:02:47 PM
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
    <head>
    </head>
    <%
        String username = request.getParameter("username");
        String passw = "";
        int type = 0;
        String password = request.getParameter("password");
        System.out.println(username + "   " + password);
        DBConnection conn = new DBConnection();
        conn.Connectiontomysql();
        String sql = "SELECT password,type FROM user where userName=?";
        System.out.println(username + "   " + password);
        conn.statement = (PreparedStatement) conn.connection.prepareStatement(sql);
        conn.statement.setString(1, username);
        ResultSet result = conn.statement.executeQuery();
        if (result.next()) {
            passw = result.getString("password");
            type = result.getInt("type");
        }
        if (!passw.equals("")) {
            if (!passw.equals(password)) {
    %>
    <script>
        alert("WRONG PASSWORD");
        window.location.href = "logIn.html";
    </script>
    <%
            } else {
                HttpSession sess=request.getSession(true);
                
                sess.setMaxInactiveInterval(3*60);
                if (type == 2) {
                    response.sendRedirect("homePage.jsp?username="+username);
                    sess.setAttribute("username",username);
                    sess.setAttribute("password",password);
                } else {
                    response.sendRedirect("homeAdmin.jsp?username="+username);
                    sess.setAttribute("userAddname",username);
                    sess.setAttribute("password",password);
                }
            }
        }
    %>
    <script>
        //alert("HOME  HOME");
        //window.location.href = "homePage.html";                        
    </script>        
</html>
