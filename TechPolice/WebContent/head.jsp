<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	 <%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
  <%@page import="java.util.Date" %>
<html>
<%@page language="java" import="java.sql.*" %>
<head>
<title>index</title>
<script type="text/javascript" src="techfiles/ajax.js"></script>
<script type="text/javascript" src="techfiles/dom.js"></script>
<script type="text/javascript" src="techfiles/valids.js"></script>

<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/dropdown-menu.css" />
<jsp:useBean id="db" class="database.dncon" />
<jsp:useBean id="mail" class="database.mail" />


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
 <%if(session.getAttribute("login")==null)
  { %>
 <jsp:forward	page="in.jsp"><jsp:param name="err" value="You must login first or sign up to use our services." /></jsp:forward>
   <%}
   else
{
	session.setAttribute("id",session.getAttribute("id"));
}
 %> 
 

 
<%  try{
						db.connect();
						ResultSet rs2=null;
						rs2=db.execSQL("select i.NAME,k.IMAGE,k.ID,i.SUBJECT_ID from SAKANSHA.SUBJECT as i,SAKANSHA.SIGNIN as k  where k.ID="+session.getAttribute("id")+" and i.SUBJECT_ID="+session.getAttribute("id"));
						
						while(rs2.next())
						{
						%>
<div id="container">
		<div id="header">
        	<h1><img src="images/sc.png" width="50" height="52"></h1>
            <h2><font color=black><b><i>Welcome Officer</i></b></font>,<font color=green> <%=rs2.getString("NAME") %></font></h2>
        </div>   
        
       <ul id="navigation" class="nav-main">
	<li><a href="index.jsp">Home</a></li>
    
    <li class="list"><a href="#">Diaries</a>
	<ul class="nav-sub">
    <li><a href="#">PS Diary</a></li>
		<li><a href="criminaldiary.jsp">Criminal I/O Diary</a></li>
		
		
	</ul>
	</li>
    
    <li class="list"><a href="#">Criminal</a>
	<ul class="nav-sub">
    <li><a href="viewcriminal.jsp">View/Edit Criminal</a></li>
 		<li><a href="addcriminal.jsp">Add Criminal</a></li>
		
		
		<li><a href="mostwanted.jsp">Most Wanted</a></li>
	</ul>
	</li>
    
    <li><a href="forwardinfo.jsp">Forward Info.</a></li>
     <li class="list"><a href="#">Mail</a>
	<ul class="nav-sub">
    <li><a href="compose.jsp">Compose</a></li>
    <li><a href="inbox.jsp">Inbox</a></li></ul></li>
    <li><a href="#">Forums</a></li>
    <li class="list"><a href="#">Generate Reports</a>
    <ul class="nav-sub">
    <li><a href="jasper/Complaints-viewer.jsp">Complaints Filed</a></li>
    <li><a href="jasper/criminal-viewer.jsp">Crime Rate</a></li>
    <li><a href="jasper/wanted-viewer.jsp">Most Wanted</a></li></ul></li>
    <li><a href="knowduties.jsp"><b>Know Your Duties</b> </a></li>
    <li><a href="logout.jsp"><font color=red>Logout</font></a></li>

</ul>

        
        <div id="leftmenu">

        <div id="leftmenu_top"></div>

				<div id="leftmenu_main">    
               
                <h3><i>Officer,</i><font color=orange> <%=rs2.getString("name") %></font></h3>
                     <img src="upload/<%=rs2.getString("IMAGE") %>" align="middle" width="200" height="167" />  <%}}catch (Exception e){out.print(e);} %><br/>
                <ul>
                    <li><a href="#"></a></li>
                    <li><a href="citifirst.jsp" >Citizen Details</a></li>
                    <li><a href="firpetty.jsp">View FIR/Petty Cases</a></li>
                    <li><a href="checklicense.jsp">License Requests</a></li>
                    <li><a href="complaintlist.jsp">Complaints</a></li>
                    <li><a href="files.jsp">Case Files</a></li>
                    <li><a href="detective.jsp">Detectives</a></li>
                    
                </ul>
</div>
                
                          
                
              <div id="leftmenu_bottom"></div>
        </div>
        
        
        
         </div>
        
        </body>
        </html>