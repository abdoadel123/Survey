<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title> Send Message </title>
        <link rel="stylesheet" type="text/css" href="SurveyStyle.css">

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script>
            function sendMessage(){
                <%%>
                var message = document.getElementById("mess").innerHTML;
                var user = document.getElementById("user").value;
                window.location.href = "sendMessege?message="+message+"&username="+user;
            }
        </script>
    </head>
    <body>
        <div class="login-box">

            <img src="avatar.png" class="avatar">

            <form name="myForm" method="POST">
                <h3> Write your message please : </h3>
                    
                <textarea id="mess" rows="10" cols="50" name="tex" >

                </textarea>
                <input type="submit" name="submit" value="Send">
                <input type="hidden" id="user" value="<%=request.getParameter("username")%> ">
            </form>


        </div>
    </body>
</html>
