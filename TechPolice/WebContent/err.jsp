<DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/dropdown-menu.css" rel="stylesheet" type="text/css" />
<jsp:useBean id="db" class="database.dncon" />
<title>FIR/Petty Cases| LAW &amp; ORDER</title>
</head>

<body>
<jsp:include page='head.jsp' flush="false"></jsp:include>
      
<div id="content">
        
        
        <div id="content_top"></div>
        <div id="content_main">
        
        <table align=center><tr><td>
		<img src="images/err.png" width="47" height="47"></img></td>
		<td><h1><font color=red>
	<%
	out.print(request.getParameter("err1"));
	 %></font></h1></td>
		
		
		</tr></table><table align="right"><tr><td><span><a onclick="javascript:history.back()" style="cursor:pointer">Back</a></span><br /></td></tr></table>
		<br />
		<jsp:include page='foot.jsp' flush="false"></jsp:include>
</body>
</html>