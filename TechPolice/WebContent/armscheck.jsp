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
								<td  style="font-size:18px"><h1><font color=maroon>Arms License Requests</font></h1></td>
							</tr>
							<% 
							try
							{
							String id=request.getParameter("id");
							
							ResultSet rs=null;
							
							db.connect();
							rs=db.execSQL("select g.on,g.arms_id,g.by,g.convict,g.convictdetails,g.licensebefore,g.licensebeforedetails,g.cancelled,g.licenseprob,g.weapon1,g.weaponneed,g.photo,g.approved_by,g.approved_on,g.comments,g.license_no,g.rejection,t.name as user,a.loc_name from sakansha.arms as g,sakansha.location as a,sakansha.subject as u,xmltable('$c/all' passing u.details as \"c\" columns name varchar(100) path 'name')as t where g.arms_id="+request.getParameter("id")+" and g.by=u.subject_id order by g.on desc");
							while(rs.next())
							{
							
							%>
							<tr ><td>Name of the weapon</td><td><%=rs.getString("weapon1") %></td></tr>
							<tr><td>Convict Details</td><td><%=rs.getString("convictdetails") %></td></tr>
							<tr><td>License Before Details</td><td><%=rs.getString("licensebeforedetails") %></td></tr>
							<tr><td>Need Of The Weapon</td><td><%=rs.getString("weaponneed") %></td></tr>
							<tr><td>License Canceled?</td><td><%=rs.getString("cancelled") %></td></tr>
							<tr><td>Canceled Reason</td><td><%=rs.getString("licenseprob") %></td></tr>
							<tr><td>Applied By</td><td><%=rs.getString("user") %></td></tr>
							<tr><td>Applied On</td><td><%=rs.getString("on") %></td></tr>
							<tr>
								<td><input type="button" value="Approve" onclick="window.location='approvelicense.jsp?idd=<%=rs.getString("arms_id") %>'"/></td>
								<td><input type="button" value="Reject" onclick="window.location='rejectlicense.jsp?id=<%=rs.getString("arms_id") %>'"/></td>
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