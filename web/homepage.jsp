<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connect.dao.Connection1"%>
<%@page import="java.sql.Connection"%>
<%@page import="logic.dao.LoginLogic"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <script>history.forward();</script>
        <style>
            #nav{
                height:100px;
                background-color:#165c82;
                width:1330px;
            }

      li {
	font-family:"Palatino Linotype", "Book Antiqua", Palatino, serif;
}

li a {
    display: block;
    color: #FFF;
    padding: 20px 30px;
    text-decoration: none;
}

li a:hover {
	color:black;
	background-color:gray;
        box-shadow: inset 0 0 1em black;
}
        </style>
        
    </head>
    <body>
        <div id="nav">
           <img src="Icfai_University12.jpg" alt="ggu" style="position:relative;top:10px;left:10px;float:left;height:65px;
                width:100px">
            <ul style="list-style-type:none;margin:0;padding:10px;overflow:hidden">
                <% 
                    try
                {
                    HttpSession s=request.getSession();
                    if(s.getAttribute("userId")!=null)
                    {
                    String v=(String)s.getAttribute("userId");
                    session.setAttribute("userId",v);
                    LoginLogic ll=new LoginLogic();
                    String type=ll.getMenu(v);
                    String[] menu=ll.getResource(type);
                    String[] url=ll.getUrl(type);
                    for(int i=0;i<menu.length;i++)
                    { 
                         %>
                     <li style="float:left;display:block;height:85px;width:150px"><a href="<%= url[i] %>"><%= menu[i] %></a></li>
                     <% }
                   
                    }
                    
                }
                    catch(Exception e)
                    {
                        System.out.println(e);
                    }
                %>
             
            
            </ul>
        </div>
       

       <%@include file="noticeboard.jsp" %> 

       <%@include file="footer.jsp" %> 
    </body>
</html>
