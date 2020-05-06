package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.lang.String;
import java.sql.ResultSet;
import com.mysql.jdbc.PreparedStatement;
import java.awt.Label;
import javafx.application.Application;
import DataBase.DBConnection;;

public final class homeAdmin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>    \n");
      out.write("    <head>\n");
      out.write("        <link href=\"homeStyle.css\" rel=\"stylesheet\">        \n");
      out.write("        <title>Home</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <script>\n");
      out.write("            function logout() {\n");
      out.write("                window.location.href = \"logIn.html\";\n");
      out.write("            }\n");
      out.write("            function suspendUser(counter){                \n");
      out.write("                var xmlrequ = new XMLHttpRequest();\n");
      out.write("                var username = document.getElementById(counter.toString()).innerHTML;\n");
      out.write("                var user=document.getElementById(\"user\").innerHTML;\n");
      out.write("                \n");
      out.write("                alert(username);\n");
      out.write("                xmlrequ.open(\"POST\", \"suspendUser?username=\" + username, true);\n");
      out.write("                xmlrequ.send();\n");
      out.write("                alert(username);\n");
      out.write("            }\n");
      out.write("            function removeSurvey(counter){\n");
      out.write("                var xmlrequ = new XMLHttpRequest();\n");
      out.write("                var survey = document.getElementById(counter.toString()).innerHTML;\n");
      out.write("                alert(survey);\n");
      out.write("                xmlrequ.open(\"POST\",\"removeSurvey?username=\"+survey, true);\n");
      out.write("                xmlrequ.send();\n");
      out.write("            }\n");
      out.write("            function suspendSurvey(){\n");
      out.write("                var xmlrequ = new XMLHttpRequest();\n");
      out.write("                var survey = document.getElementById(\"survey\").value;\n");
      out.write("                xmlrequ.open(\"GET\", \"sussSurvey?username=\" +survey, true);\n");
      out.write("                xmlrequ.send();                \n");
      out.write("            }\n");
      out.write("            function addAdmin(){\n");
      out.write("                var xmlrequ = new XMLHttpRequest();\n");
      out.write("                var user = document.getElementById(\"user\").value;\n");
      out.write("                xmlrequ.open(\"GET\", \"addAdmin?user=\" +user, true);\n");
      out.write("                xmlrequ.send();\n");
      out.write("            }\n");
      out.write("            function editUserPass(){\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");

                    DBConnection conn = new DBConnection();
                    conn.Connectiontomysql();
                    String sql = "SELECT serveyName,state FROM survey where state=?";
                    String serv = "";
                    conn.statement = (PreparedStatement) conn.connection.prepareStatement(sql);
                    conn.statement.setInt(1,1);
                    ResultSet result = conn.statement.executeQuery();

      out.write("\n");
      out.write("    <body>\n");
      out.write("        <ul>            \n");
      out.write("            <li><a ><img class=\"avatar\" src=\"avatar.png\" height=\"110\" width=\"110\" alt=\"sometext\" id=\"user\">");
out.print(request.getParameter("username"));
      out.write("</a>            \n");
      out.write("                <ul>                    \n");
      out.write("                    <li><a>Add Pool</a></li>\n");
      out.write("                    <li><a>Add Survey</a></li>\n");
      out.write("                    <li><a>Add Administration</a></li>\n");
      out.write("                    <li><a>Notifications</a></li>\n");
      out.write("                    <li><a>Suspend User</a></li>\n");
      out.write("                    <li><a>Edit Password</a></li>\n");
      out.write("                    <li><a>Edit User Password</a></li>\n");
      out.write("                    <li><a>Global Message</a></li>\n");
      out.write("                    <li><a>Remove/Suspend pool</a></li>\n");
      out.write("                    <li><a>My Mail</a></li>\n");
      out.write("                    <li ><a onclick=\"logout()\">Logout</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"X\">Available Surveys\n");
      out.write("                <ul>\n");
      out.write("                    ");

                        while(result.next()){
                            String var = result.getString("serveyName");  
                            int stat=result.getInt("state");
                            if(stat!=3){
                            
      out.write("\n");
      out.write("                            <li><a class=\"src\">");
      out.print(var);
      out.write("</a>\n");
      out.write("                            <li class=\"bu\"><a>Delete</a></li>\n");
      out.write("                            <li class=\"bu\"><a>Suspend</a></li>\n");
      out.write("                            </li>                            \n");
      out.write("                            ");
    
                            }
                        }
                        
                    
      out.write("\n");
      out.write("                </ul>                                \n");
      out.write("            </li>\n");
      out.write("            ");

                    HttpSession sess=request.getSession(true);
                    String username=(String)sess.getAttribute("userAddname");
                    sql = "SELECT serveyName,state FROM survey where userName=? and state=?";
                    
                    String serv2 = "";
                    conn.statement = (PreparedStatement) conn.connection.prepareStatement(sql);
                    conn.statement.setString(1, username);
                    conn.statement.setInt(2,1);
                    result = conn.statement.executeQuery();
           
      out.write("\n");
      out.write("            <li class=\"X\">My Surveys\n");
      out.write("                <ul>\n");
      out.write("                    ");

                        int counter=0;
                        while(result.next()){
                            serv2 = result.getString("serveyName"); 
                            int stat=result.getInt("state");
                            if(stat!=3){
                            
      out.write("\n");
      out.write("                            <li><a class=\"src\" id=\"\"");
      out.print(("survey"+counter));
      out.write('"');
      out.write('>');
      out.print(serv2);
      out.write("</a>\n");
      out.write("                            <li class=\"bu\"><a onclick=\"removeSurvey('");
      out.print("survey"+counter);
      out.write("')\">Close</a></li>\n");
      out.write("                            <li class=\"bu\"><a>Suspend</a></li>\n");
      out.write("                            <li class=\"bu\"><a>Show</a></li>\n");
      out.write("                            </li>                            \n");
      out.write("                            ");

                            counter++;
                            }
                        }
                    
      out.write("\n");
      out.write("                </ul>                                \n");
      out.write("            </li>\n");
      out.write("            ");

                    sql = "SELECT userName FROM user where state=?";
                    conn.statement = (PreparedStatement) conn.connection.prepareStatement(sql);
                    conn.statement.setInt(1,1);
                    result = conn.statement.executeQuery();
           
      out.write("\n");
      out.write("            <li class=\"X\">Users\n");
      out.write("                <ul>                    \n");
      out.write("                    ");

                        counter = 0;
                        String use=(String)sess.getAttribute("userAddname");
                        while(result.next()){                            
                            String var="";
                            var = result.getString("userName");
                            if(!use.equals(var)){
                    
      out.write("        \n");
      out.write("                            <li>\n");
      out.write("                                <div class=\"src\" id=\"");
      out.print(("username"+counter));
      out.write('"');
      out.write('>');
      out.print(var);
      out.write("</div>                                \n");
      out.write("                                    <li class=\"bu\"><a>Edit</a></li>\n");
      out.write("                                    <li class=\"bu\"><a onclick=\"suspendUser('");
      out.print("username"+counter);
      out.write("')\">Suspend</a></li>                                \n");
      out.write("                            </li>                            \n");
      out.write("                            ");
 
                        }
                            counter++;
                        }
                    
      out.write("\n");
      out.write("                </ul>                                \n");
      out.write("            </li>\n");
      out.write("        </ul>\n");
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
