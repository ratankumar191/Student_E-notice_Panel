<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password Change</title>
        <script>history.forward();</script>
        <style>
            #add {
            color:#FFF;
            background-image:url(background.jpg);
            background-repeat: no-repeat;
            position:absolute;
            top:150px;
            left:430px;
            height:400px;
            width:480px;
            box-shadow: 10px 10px 10px slategray;
            
        }
       form {
            position:relative;
            text-align: center;
            top:30px;
        }
        p {
            position:absolute;
            top:110px;
            left:550px;
        }
            hr{
                width:50%;
            }
        </style>
    </head>
    <body>
        <%@include file="navi.jsp" %> 
        <%
            if(request.getAttribute("message")!=null)
            { %>
            <p><%= request.getAttribute("message") %></p>
           <% }
        %>
        <% 
                    try
                {
                    HttpSession s=request.getSession();
                    if(s.getAttribute("userId")!=null)
                    {
                    String v=(String)s.getAttribute("userId");
                    out.println(v);
                    session.setAttribute("userId",v);
                   
                    }
                }
                    catch(Exception e)
                    {
                        System.out.println(e);
                    }
                %>
        <div id="add">
            <center><h2>Change Password</h2></center>
        <hr>
        <form action="ChangePass">
            <input type="password" name="password" placeholder="enter current password"><br/><br/>
            <input type="password" name="newpassword" placeholder="enter new password"><br/><br/>
            <input type="Submit" name="submit" value="Change Password">
            </form>
        </div>
    </body>
</html>
