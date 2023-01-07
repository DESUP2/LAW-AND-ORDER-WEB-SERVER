<DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<%@page language="java" import="java.util.Date" %>
 <%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
  <%@page import="java.util.Date" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="techfiles/othervalids.js"></script>
<link href="css/dropdown-menu.css" rel="stylesheet" type="text/css" />
<jsp:useBean id="db" class="database.dncon" />
<title>Citizen Sign Ups Today| LAW &amp; ORDER</title>
</head>

<body>

      
        <script type="text/javascript" src="techfiles/othervalids.js"></script>
    <jsp:include page='head.jsp' flush="false"></jsp:include>
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        
        <table width='100%' border="0">
<tr>
	

<!--content column start -->
<td width='80%' valign="top">

	<table align=center><tr><td><h1>Know You Duty</h1></td></tr></table>
	<table width='100%' border="0" ><tr>
		<td >
			<%//no more static content. Taken entirely from database.
			db.connect();
			ResultSet rs=db.execSQL("select * from SAKANSHA.KNOW_DUTIES");
			while(rs.next())
			{
			
			 %>
			<table width='97%' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top'>
				
				<tr><td style='text-align:left;vertical-align: top'><b>TITLE : </b><%=rs.getString("SUBJECT") %></td></tr>
				
				<tr><td style='text-align:left;vertical-align: top'><b>MESSAGE: </b><%=rs.getString("MESSAGE") %></td></tr>
			
			<%
			}
			db.close();
			 %>
		</table>
		</td>
	</tr>
</table></td>


</tr></table>
<jsp:include page='foot.jsp' flush="false"></jsp:include>

</body>
</html>