<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page language="java" import="java.sql.*" %>
<%@page language="java" import="java.util.Date" %>
<jsp:useBean id="db" class="database.dncon" />
 <%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
  <%@page import="java.util.Date" %>
  <%@page language="java" import="java.io.*, javax.swing.*, java.awt.*,
java.sql.*, java.util.*, net.sf.jasperreports.engine.*,
net.sf.jasperreports.view.*;" %>
<html>
<head>
<title>License Requests |Law &amp; Order Automation</title>
</head>
<body>
<jsp:include page='head.jsp' flush="false"></jsp:include>
      
        
    
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        <table>
        
        <% 
							
							
							ResultSet rs=null;
							
							db.connect();
							rs=db.execSQL("select g.subject,g.message from sakansha.mail as g where id="+request.getParameter("id")+"");
							while(rs.next())
							{
							
							%>
<tr><td><i>Subject</i></td><td><%rs.getString("subject"); %></td></tr>
<tr><td><i>message</i></td><td><%rs.getString("message"); %></td></tr> <%} %></table>

<jsp:include page='foot.jsp' flush="false"></jsp:include>
</body>
</html>