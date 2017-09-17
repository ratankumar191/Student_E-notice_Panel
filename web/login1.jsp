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
            top:220px;
            left:160px;
        }
    </style>
    </head>
    <body>
        <% try
                {
                    HttpSession s=request.getSession();
                    if(s==null && s.getAttribute("userId")==null)
                    {  %>   <script>history.forward();</script>
                   <% }
                }
                catch(Exception e)
                {
                out.println(e);
                }
        %>
        <%
            if(request.getAttribute("message")!=null)
            { %>
            <p><%= request.getAttribute("message") %></p>
           <% }
        %>
        <center>
        <div id="back">
            <h1>ICFAI UNIVERSITY</h1>
            <h1>Notice Log_in Panel</h1>
        </div>
    </center>
    
    <center><div id="log">
            <center><form action="Login">
                <input type="text" name="userId" placeholder="enter username"><br/><br/>
                <input type="password" name="password" placeholder="enter password"><br/><br/>
                <input type="checkbox" name="rem" value="rememeber"><label style="color:white">Remember Me</label><br/><br/>
                <input type="Submit" name="submit" value="Login">
                </form>
            <div id="reg">
                <h3 style="color:white">Not a registered user?</h3>
            <h3><a href="Registration.jsp">Sign up</a></h3>
            </div>
            </center>
        </div></center>
    </body>
</html>