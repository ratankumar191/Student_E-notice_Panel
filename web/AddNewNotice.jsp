<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Notice</title>
        <script>history.forward();</script>
        <style>
            body{background-color: #d5d5d5;}
            #add {
                color:#4B4B4B;
            background-image: url(background.jpg);
            background-repeat: no-repeat;
            position:absolute;
            top:150px;
            left:430px;
            height:420px;
            width:480px;
            box-shadow: 10px 10px 10px slategray;
           
            p {
            position:absolute;
            top:120px;
            left:520px;
            color:cadetblue;
        }
        }
       form {
            position:relative;
            text-align: center;
            top:18px;
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
        
        <div id="add">
            <center><h2>Add New Notice</h2></center>
        <hr>
        <form action="AddNotice">
            <input type="text" name="Heading" placeholder="Add Heading" size="45"><br/><br/>
            <input type="text" name="Date" placeholder="mon-dd-yyyy"><br/><br/>
            <textarea cols="45" rows="10" name="Detail" placeholder="Write Notice Here"></textarea><br/><br/>
            <% 
                    try
                {
                    HttpSession s=request.getSession();
                    if(s.getAttribute("userId")!=null)
                    {
                    String v=(String)s.getAttribute("userId");
                    s.setAttribute("userId",v);
                    LoginLogic ll=new LoginLogic();
                    String type=ll.getMenu(v);
                    %>
                    <select name="user">
                        <option value="<%= type %>"><%= type  %></option>
                </select><br/><br/>
                    
                    <% }
                }
                    catch(Exception e)
                    {
                        System.out.println(e);
                    }
                %>

            
            <input type="Submit" name="submit" value="Add Notice">
            </form>
        </div> 
    </body>
</html>
