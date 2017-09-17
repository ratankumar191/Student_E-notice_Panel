
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        </style>
    </head>
    <body>
        <%@include file="navi.jsp" %>
    <center><div id="all">
            <h2>Allocate Resources</h2>
            <hr>
            <form>
                <select name="user">
                    <option value="ankita">Ankita</option>
                    <option value="garima">Garima</option>
                    <option value="bhanu">Bhanu</option>
                </select><br/><br/><br/>
                <input type="checkbox" name="ch" value="home">Home<br/><br/>
                <input type="checkbox" name="ch" value="academicdetails">Academic Details<br/><br/>
                <input type="checkbox" name="ch" value="attendance">Attendance<br/><br/>
                <input type="checkbox" name="ch" value="change password">Change Password<br/><br/>
                <input type="checkbox" name="ch" value="addnotice">Add Notice<br/><br/>
                <input type="checkbox" name="ch" value="logout">Logout<br/><br/>
                <input type="Submit" name="Submit" value="Allocate Resources">
            </form>
        </div>
    </center>
    </body>
</html>
