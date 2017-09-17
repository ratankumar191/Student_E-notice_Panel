
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change My Role</title>
        <script>history.forward();</script>
        <style>
            body{background-color:#a2a2a2;}
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
            <center><h2>Choose Role To Change</h2></center>
        <hr>
        <form action="SubmitRequest">
            <select name="role">
                    <option value="superadmin">superadmin</option>
                    <option value="deptadmin">deptadmin</option>
                    <option value="clubadmin">clubadmin</option>
                    <option value="user">user</option>
                </select><br/><br/><br/>
            <input type="Submit" name="submit" value="Request for Role Change">
            </form>
        </div>
    </body>
</html>
