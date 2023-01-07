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
        
        <script type="text/javascript" src="techfiles/dom.js"></script>
        <table  width='73%'><tr><td colspan='5'><font color=brown><h3>Options For Licenses</h3></font><br/><br/></td></tr><tr><td align='center'><input  onclick="javascript:window.location='checklicense.jsp'" value="New License Requests" type="button" /></td><td align='center'><input  onclick="javascript:window.location='licenseok.jsp'" value="Approved Licenses" type="button" /></td><td align='center'><input  onclick="javascript:window.location='licensereject.jsp'" value="Rejected Licenses" type="button" /></td><td align='center'><input  onclick="javascript:window.location='vlicense.jsp'" value="All Licenses" type="button" /></td></tr><tr><td colspan='5'><hr/></td></tr></table>
      <table width='100%'>
				<tr>
					
					<td width="100%" valign="top">
						<table width="100%" cellpadding="6"  cellspacing="6">
							<tr>
								<td  style="font-size:18px">Arms License Requests</td>
							</tr>
							<% 
							try
							{
							

							
							db.connect();
							db.updateSQL("update sakansha.arms set status=1,approved_by="+session.getAttribute("id")+",approved_on=current_timestamp,comments='Application Accepted',rejection='no' where arms_id="+request.getParameter("idd"));
								%>
		<jsp:forward page="checklicense.jsp?err=Accept In Arms License"></jsp:forward>
								<%
							db.close();
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