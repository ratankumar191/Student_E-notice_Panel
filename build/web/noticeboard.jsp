<%@page import="logic.dao.NoticeLogic"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
#notice {
    background-color:#ce8483;
  position:absolute;
  top:150px;
  height:530px;
  width:1330px;
  text-align: center;
}
h3 {
  color: #00c6d7;
  font-size: 14px;
  font-weight: bold;
}
#notice .col-md-3 {
  padding-top: 20px;
  padding-bottom: 20px;
}

#notice {
    text-align: center;
}
#notice .col-md-4 {
  text-align:center;
  float:left;
  height:450px;
  width:350px;
  border-color: #4B4B4B;
  border-width: 5px;
  padding: 28px;
  transition: all 0.4s ease-in-out;

}
#notice .col-md-4:hover {
  text-align:center;
  background-color: #ffffff;
  box-shadow: 0px 2px 8px 0px rgba(50, 50, 50, 0.20);
}
#notice h3 {
  font-size: 18px;
}

#notice p {
  font-size: 18px;
}
        </style>
    </head>
    <body>
        <div id="notice">
			<div class="col-md-12 col-sm-12">
				<div>
					<!--<strong>01</strong>-->
					<h1 class="heading bold">NOTICE BOARD</h1>
					<hr width="50%">
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4 wow fadeInUp" data-wow-delay="0.6s">
					<h3>UNIVERSITY Notice</h3>
					<hr>
           <% 
               try
           { 
               NoticeLogic nl=new NoticeLogic();
               String[] main=nl.getNoticeMain();
                 %>
                     <marquee direction="up" height="300px" onmouseover="this.stop();" onmouseout="this.start()">
                         <p>
                             <%  for(int i=0;i<main.length;i++)
                                { 
                                    out.println(main[i]); %>
                                    <br/><br/>
                                    <% }
                             %>
                         </p></marquee>
                     <%
                   
                }
                    catch(Exception e)
                    {
                        System.out.println(e);
                    }
           %>
                                        
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4 wow fadeInUp" data-wow-delay="0.9s">
					<h3>DEPARTMENTAL NOTICE</h3>
					<hr>
           <% 
               try
           { 
               NoticeLogic nl=new NoticeLogic();
               String[] main=nl.getNoticeDept();
               %>
                     <marquee direction="up" height="300px" onmouseover="this.stop();" onmouseout="this.start()">
                         <p>
                             <%  for(int i=0;i<main.length;i++)
                                { 
                                    out.println(main[i]); %>
                                    <br/><br/>
                                    <% }
                             %>
                         </p></marquee>
                     <%
                   
                }
                    catch(Exception e)
                    {
                        System.out.println(e);
                    }
          %>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4 wow fadeInUp" data-wow-delay="1s">
					<h3>CLUB NOTICE</h3>
					<hr>
	<% 
               try
           { 
               NoticeLogic nl=new NoticeLogic();
               String[] main=nl.getNoticeClub();
               %>
                     <marquee direction="up" height="300px" onmouseover="this.stop();" onmouseout="this.start()">
                         <p>
                             <%  for(int i=0;i<main.length;i++)
                                { 
                                    out.println(main[i]); %>
                                    <br/><br/>
                                    <% }
                             %>
                         </p></marquee>
                     <%
                }
                    catch(Exception e)
                    {
                        System.out.println(e);
                    }
          %>
                        </div>
  </div>

    </body>
</html>
