<%@page import="java.lang.String"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.awt.Label"%>
<%@page import="javafx.application.Application"%>
<%@page import="DataBase.DBConnection;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>    
    <head>
        <link href="homeStyle.css" rel="stylesheet">        
        <title>Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script>
            function logout() {
                window.location.href = "logIn.html";
            }
            function suspendUser(counter){                
                var xmlrequ = new XMLHttpRequest();
                var username = document.getElementById(counter.toString()).innerHTML;
                var user=document.getElementById("user").innerHTML;
                xmlrequ.open("POST", "suspendUser?username=" + username, true);
                xmlrequ.send();
                //window.location.href="homeAdmin.jsp?username="+document.getElementById("user").innerHTML;
            }
            function removeSurvey(counter){
                var xmlrequ = new XMLHttpRequest();
                alert(counter);
                var survey = document.getElementById(counter.toString()).innerHTML;
                alert(survey);
                xmlrequ.open("POST","removeSurvey?survey="+survey, true);
                xmlrequ.send();
                //window.location.href="homeAdmin.jsp?username+"+document.getElementById("user").innerHTML;
            }
            function suspendSurvey(counter){
                var xmlrequ = new XMLHttpRequest();
                var survey = document.getElementById(counter.toString()).innerHTML;
                xmlrequ.open("POST", "sussSurvey?survey=" +survey, true);
                xmlrequ.send();
                //window.location.href="homeAdmin.jsp?username+"+document.getElementById("user").innerHTML;
            }
            function addAdmin(counter){
                var xmlrequ = new XMLHttpRequest();
                var user = document.getElementById(counter.toString()).innerHTML;
                xmlrequ.open("GET", "addAdmin?user=" +user, true);
                xmlrequ.send();
                //window.location.href="homeAdmin.jsp?username+"+document.getElementById("user").innerHTML;
            }
            function editUserPass(){
                
            }
            function sendMess(counter){
                //var xmlrequ = new XMLHttpRequest();                                
                var user = document.getElementById(counter.toString()).innerHTML;
                //window.location.href="SendMSG.jsp?username+"+user;
            }
            function sendGloMess(){
                
            }
        </script>
    </head>
<%
                    DBConnection conn = new DBConnection();
                    conn.Connectiontomysql();
                    String sql = "SELECT serveyName,state FROM survey";
                    String serv = "";
                    conn.statement = (PreparedStatement) conn.connection.prepareStatement(sql);
                    //conn.statement.setInt(1,1);
                    ResultSet result = conn.statement.executeQuery();
%>
    <body>
        <ul>            
            <li><a ><img class="avatar" src="avatar.png" height="110" width="110" alt="sometext" id="user"><%out.print(request.getParameter("username"));%></a>            
                <ul>                    
                    <li><a>Add Survey</a></li>
                    <li><a>Notifications</a></li>
                    <li><a>Edit Password</a></li>
                    <li><a>Send Global Message</a></li>
                    <li><a>My Mail</a></li>
                    <li ><a onclick="logout()">Logout</a></li>
                </ul>
            </li>
            <li class="X">Available Surveys
                <ul>
                    <%
            int counter=0;
                        while(result.next()){
                            String var = result.getString("serveyName");  
                            int stat=result.getInt("state");
                            if(stat!=3){
                            %>
                            <li><a class="src" id="<%=("survey"+counter)%>"><%=var%></a>
                                <li class="bu"><a onclick="removeSurvey('<%="survey"+counter%>')">Close</a></li>
                                <li class="bu"><a onclick="suspendSurvey('<%="survey"+counter%>')">Suspend</a></li>
                            </li>                            
                            <%    
                            }
                            counter++;
                        }
                        
                    %>
                </ul>                                
            </li>
            <%
                    HttpSession sess=request.getSession(true);
                    String username=(String)sess.getAttribute("userAddname");
                    sql = "SELECT serveyName,state FROM survey where userName=?";
                    
                    String serv2 = "";
                    conn.statement = (PreparedStatement) conn.connection.prepareStatement(sql);
                    conn.statement.setString(1, username);
                    //conn.statement.setInt(2,3);
                    result = conn.statement.executeQuery();
           %>
            <li class="X">My Surveys
                <ul>
                    <%
                        counter=0;
                        while(result.next()){
                            serv2 = result.getString("serveyName"); 
                            int stat=result.getInt("state");
                            if(stat != 3){
                                %>
                                <li><a class="src" id="<%=("survey"+counter)%>"><%=serv2%></a>
                                <li class="bu"><a onclick="removeSurvey('<%="survey"+counter%>')">Close</a></li>
                                <li class="bu"><a onclick="suspendSurvey('<%="survey"+counter%>')">Suspend</a></li>
                                <%if(stat!=2){%>
                                <li class="bu"><a>Show</a></li>
                                <%}%>
                                </li>                            
                                <%
                                counter++;
                            }
                        }
                    %>
                </ul>                                
            </li>
            <%
                    sql = "SELECT userName,type FROM user where state=?";
                    conn.statement = (PreparedStatement) conn.connection.prepareStatement(sql);
                    conn.statement.setInt(1,1);
                    result = conn.statement.executeQuery();
           %>
            <li class="X">Users
                <ul>                    
                    <%
                        counter = 0;
                        String use=(String)sess.getAttribute("userAddname");
                        while(result.next()){                            
                            String var="";
                            var = result.getString("userName");
                            int type=result.getInt("type");
                            if(!use.equals(var)){
                    %>        
                            <li>
                                <div class="src" id="<%=("username"+counter)%>"><%=var%></div>                                
                                    <li class="bu"><a>Edit</a></li>
                                    <li class="bu"><a onclick="suspendUser('<%="username"+counter%>')">Suspend</a></li> 
                                    <%
                                    if(type!=1){
                                    %>
                                    <li class="bu"><a onclick="addAdmin('<%="username"+counter%>')">Add As Admine</a></li>
                                    
                                    <%}%>
                                    <li class="bu"><a onclick="addAdmin('<%="username"+counter%>')">Send Message</a></li>
                            </li>                            
                            <% 
                        }
                            counter++;
                        }
                    %>
                </ul>                                
            </li>
        </ul>


    </body>
</html>
