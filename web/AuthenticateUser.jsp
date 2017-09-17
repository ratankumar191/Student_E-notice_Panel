<%@page import="logic.dao.UserAuthentication"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Authentication</title>
        <script>history.forward();</script>
        <style>
            #all {
            background-image:url(background.jpg);
            position:absolute;
            top:150px;
            left:430px;
            height:400px;
            width:480px;
            box-shadow: 10px 10px 10px slategray;
            }
            h2{
                color:#FFF;
            }
            hr{
                width:50%;
            }
            p {
            position:absolute;
            top:110px;
            left:550px;
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
        
    <center><div id="all">
            <h2>List of Unauthenticated Users</h2>
            <hr>
            <form action="Authentication">
                <% 
                    try
                {
                    HttpSession s=request.getSession();
                    if(s.getAttribute("userId")!=null)
                    {
                    String v=(String)s.getAttribute("userId");
                    session.setAttribute("userId",v);
                    String status="false";
                    UserAuthentication ua=new UserAuthentication();
                    String[] uu=ua.getunauthUser(status);
                    for(int i=0;i<uu.length;i++)
                    { 
                         %>
                         <input type="checkbox" name="ch" value="<%= uu[i] %>"><%= uu[i] %><br/><br/>   
                     <% }
                   
                    }
                }
                    catch(Exception e)
                    {
                        System.out.println(e);
                    }
                %>
                
                <input type="Submit" name="Submit" value="Authenticate User">
            </form>
        </div>
    </center>
    </body>
</html>
