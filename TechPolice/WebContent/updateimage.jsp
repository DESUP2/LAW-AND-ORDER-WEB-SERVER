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
<title>Update Image| LAW &amp; ORDER</title>
</head>

<body>

      
        <script type="text/javascript" src="techfiles/othervalids.js"></script>
    <jsp:include page='head.jsp' flush="false"></jsp:include>
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        
        <form name="RegistrationForm" method="post" onsubmit="" action="updateimagecheck.jsp" enctype="multipart/form-data" >
        <table align=center>
        <tr>
        <td >Upload You Image: <span class='style3'></span></td>
		 			<td><input type="file" name="photo" /></td>
		 			</tr>
		 <tr>
		<td width="25%">&nbsp;</td>
		<td><input id="submit" type="submit" value="Update"/></td>
		<td><input type="reset" value="Reset"/></td>
		<td width="25%">&nbsp;</td>
		
	</tr>
		 			</table></form>
		 			
		 			
		 			<jsp:include page='foot.jsp' flush="false"></jsp:include>
</body>
</html>