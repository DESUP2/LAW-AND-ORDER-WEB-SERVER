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
        
        <table width='100%'>
				<tr><td><a href="mostwanted.jsp">Back</a></td></tr>
				<tr>
				
					<td width="50%" valign="top">
						<table  cellpadding="6"  cellspacing="6">
							
							<% 
							try
							{
							
							ResultSet rs=null;
							
							db.connect();
							rs=db.execSQL("select i.id,i.file,t.name1,t.last,t.height,t.weight from sakansha.criminal as i,xmltable('$c/criminal' passing i.details as \"c\" columns name1 varchar(100) path 'name1',last varchar(500) path 'last',height varchar(10) path 'height',weight varchar(10) path 'weight') as t   order by on ");
							while(rs.next())
							{
							
							%>
							<tr>
								<td>
									<img style="height:100px;width: 100px" src="upload/criminal/<%=rs.getString("file") %>"/>
								</td>
								<td valign="top">
									<table>
										<tr><td>Name</td><td><a href='criminalview.jsp?id=<%=rs.getString("id") %>'><%=rs.getString("name1") %></a></td></tr>
										<tr><td>Last Seen At</td><td><%=rs.getString("last") %></td></tr>
										<tr><td>Height</td><td><%=rs.getString("height") %></td></tr>
										<tr><td>weight</td><td><%=rs.getString("weight") %></td></tr>
										<tr><td><input type="button" value="View /update" onclick="javascript:window.location='criminalview.jsp?id=<%=rs.getString("id") %>'"/></td></tr>
									</table>
									
								</td>
								
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
						
					</td>
				</tr>
				
				
			</table>
			<jsp:include page='foot.jsp' flush="false"></jsp:include>
</body>
</html>