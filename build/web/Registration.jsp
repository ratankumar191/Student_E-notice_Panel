<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>history.forward();</script>
    
    <style>
        h1{background-color: #515151;
                
            }
            body{background-color:#999; }
        #back{
            color:black;
        }
        p{
            position:absolute;
            top:90px;
            left:520px;
            color:red;
        }
       #log {
            background-image: url(background.jpg);
            background-repeat: no-repeat;
            position:absolute;
            top:150px;
            left:300px;
            right: 100px;
            height:500px;
            width:60%;
            box-shadow: 10px 30px 20px slategray;
            
        }
       
       form {
            position:absolute;
            top:80px;
            left:160px;
        }
        #reg {
            position:absolute;
            top:350px;
            left:445px;
        }
    </style>
    </head>
    <body>
        <%
            if(request.getAttribute("message")!=null)
            { %>
            <p><%= request.getAttribute("message") %></p>
           <% }
        %>
        <center>
        <div id="back">
            <h2>ICFAI University</h2>
            <h3>Student's Portal</h3>
        </div>
    </center>
    
    <center><div id="log">
            <center><form action="Register">
                <input type="text" name="userId" placeholder="enter userId"><br/><br/>
                <input type="password" name="password" placeholder="enter password"><br/><br/>
                <br/>
                <input type="Submit" name="submit" value="Register">
                </form></center>
        </div></center>
    
    <div id="reg">
            <h3><a href="login1.jsp">Go Back To Login Page</a></h3>
            </div>
    </body>
</html>
