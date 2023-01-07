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
<title>Most Wanted Criminals |Law &amp; Order Automation</title>
</head>
<body>
<jsp:include page='head.jsp' flush="false"></jsp:include>
      
        
    
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        <script type="text/javascript" src="techfiles/dom.js"></script>
        
        <table width="100%" cellpadding="6"  cellspacing="6" align="center">
							<tr>
								<td  style="font-size:18px" width="178"><font color=maroon>Most Wanted Criminals</font></td>
							</tr>
							<tr bgcolor=orange><td>Name</td><td>Image</td></tr>
							<% 
							try
							{
							
							ResultSet rs=null;
							
							db.connect();
							rs=db.execSQL("select i.id,i.file,t.name1 from sakansha.criminal as i,xmltable('$c/criminal' passing i.details as \"c\" columns name1 varchar(100) path 'name1') as t where wanted=1 order by on");
							while(rs.next())
							{
							
							
							%>
							<tr>
								<td width="178"><a href='criminalview.jsp?id=<%=rs.getString("id") %>'><%=rs.getString("name1") %></a></td><td width="365"><img
			src="upload/criminal/<%=rs.getString("file") %>" width="96"
			height="96" /> </td>
							</tr>
							<%
									
							}
							}
							catch(Exception e)
							{
							out.println("Error"+e.getMessage());
							}
							 %>							
						</table>
<jsp:include page='foot.jsp' flush="false"></jsp:include>
</body>
</html>