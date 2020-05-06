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
            function logOut(){                
                window.location.href = "logOut.jsp";
            }
            function edite(){
                window.location.href = "EditPass.html";
            }
            function addSurvey(){
                window.location.href = "addQuestion.html";
            }
            function report(counter){
                var survey=document.getElementById(counter.toString()).innerHTML;
                var xmlrequ = new XMLHttpRequest();
                xmlrequ.open("GET", "report?survey=" +survey, true);
                xmlrequ.send();
            }
            function removeSurvey(counter){
                var xmlrequ = new XMLHttpRequest();
                alert(counter);
                var survey = document.getElementById(counter.toString()).innerHTML;
                alert(survey);
                xmlrequ.open("POST","removeSurvey?survey="+survey, true);
                xmlrequ.send();
            }
            function suspendSurvey(counter){
                var xmlrequ = new XMLHttpRequest();
                var survey = document.getElementById(counter.toString()).innerHTML;
                xmlrequ.open("POST", "sussSurvey?survey=" +survey, true);
                xmlrequ.send();                
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
                    int counter=0;
%>
    <body>
        <ul>            
            <li><a><img class="avatar" src="avatar.png" height="100" width="100" alt="sometext"><%out.print(request.getParameter("username"));%></a>            
                <ul>                    
                    <li><a onclick="addSurvey()">Add Survey</a></li>
                    <li><a>Add Pool</a></li>
                    <li><a onclick="edite()">Edit Password</a></li>
                    <li><a>My Mail</a></li>
                    <li><a onclick="logOut()">Logout</a></li>
                </ul>
            </li>
            
            
            
            <li class="X">Available Surveys
                <ul>
                    <%
                        counter=0;
                        while(result.next()){
                            String var = result.getString("serveyName");  
                            int stat=result.getInt("state");
                            if(stat!=3){
                            %>
                            <li><a class="src" id="<%=("survey"+counter)%>"><%=var%></a>
                            <li class="bu"><a onclick="report('<%=("survey"+counter)%>')">Report</a></li>
                                <%
                                if(stat!=2){
                                %>
                                <li class="bu"><a onclick="">Show</a></li>
                                <%}%>
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
                    String username=(String)sess.getAttribute("username");
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
        </ul>
    </body>
</html>
