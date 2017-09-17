<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connect.dao.Connection1"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Role Requests</title>
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
            form {
            position:relative;
            alignment-adjust: central;
            top:50px;
            }
        
            h2{
                color:#FFF;
            }
            p {
            position:absolute;
            top:110px;
            left:570px;
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
    <center><div id="all">
            <h2>Role Change Requests</h2>
            <hr>
            <form action="ChangemyRole">
                <table border="2">
                    <tr>
                        <th>UserId</th>
                        <th>Current Role</th>
                        <th>Requested Role</th>
                        <th>Select</th>
                    </tr>
                <% 
                    try
                {
                    HttpSession s=request.getSession();
                    if(s.getAttribute("userId")!=null)
                    {
                    String v=(String)s.getAttribute("userId");
                    session.setAttribute("userId",v);
      
                    Connection con=Connection1.dbConnection();
                    PreparedStatement abc=con.prepareStatement("select * from role_change");
                    ResultSet rs=abc.executeQuery();
                    while(rs.next())
                    { 
                         %>
                           <tr>
                        <th><%= rs.getString(1) %></th>
                        <th><%= rs.getString(2) %></th>
                        <th><%= rs.getString(3) %></th>
                        <th><input type="checkbox" name="ch" value="<%= rs.getString(1) %>">Change Role</th>
                    </tr> 
                     <% }
                   
                    }
                }
                    catch(Exception e)
                    {
                        System.out.println(e);
                    }
                %>
                </table>
                <br/><br/>
                
                <input type="Submit" name="Submit" value="Change User Role">
            </form>
        </div></center>
    </body>
</html>
