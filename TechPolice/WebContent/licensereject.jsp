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
        <table width='100%' >
				<tr>
					
					<td width="100%" valign="top">
						<table width="100%" >
						
							<tr>
								<td  style="font-size:18px" colspan="4"><font color=maroon><b>Arms License Requests</b></font></td>
							</tr>
							<tr ><td colspan="4"><br/></td></tr>
							<tr bgcolor=orange>
								<td><b>Applied ON</b></td>
								<td><b>Weapon</b></td>
								<td><b>Reject By</b></td>
								<td><b>Applied username</b></td>
							</tr>
							
							<tr><td colspan="4"><hr/></td></tr>
							<% 
							try
							{
							
							ResultSet rs=null;
							
							db.connect();
							rs=db.execSQL("select g.arms_id,g.weapon1,g.status,g.convict,g.convictdetails,g.on,g.by as user,a.id,a.username from sakansha.arms as g,sakansha.signin as a where g.status=2 and g.by=a.id order by g.on desc");
							while(rs.next())
							{
							
							%>
							
							<tr style="cursor:pointer" onclick="javascript:window.location='loadgym.jsp?id=<%=rs.getString("id") %>'">
								<td><%=rs.getString("on") %></td>
								<td><%=rs.getString("weapon1") %></td>
								<td><%=rs.getString("convict") %></td>
								<td><%=rs.getString("username") %></td>
							</tr>
							<tr><td colspan="4"><hr/></td></tr>
							<%
									
							}
							}
							catch(Exception e)
							{
							out.println("Error"+e.getMessage());
							}
							 %>							
						</table>
							<table width="100%" >
							<tr><td colspan="4"><br/></td></tr>
							<tr>
								<td  style="font-size:18px" ><font color=maroon><b>Lodge/Hotel License Requests</b></font></td>
							</tr>
							<tr><td colspan="4"><br/></td></tr>
							<tr bgcolor=orange>
								<td width="202"><b>Owner Name</b></td>
								<td><b>Address</b></td>
								<td><b>Area name</b></td>
								<td><b>Applied username</b></td>
							</tr>
							<tr><td colspan="4"><hr/></td></tr>
							<% 
							try
							{
							
							ResultSet rs=null;
							
							db.connect();
							rs=db.execSQL("select g.id,g.owner_name,t.name as user,g.address,a.loc_name from sakansha.hotel as g,sakansha.location as a,sakansha.subject as u,xmltable('$c/all' passing u.details as \"c\" columns name varchar(100) path 'name')as t where g.status=2 and g.area=a.loc_id and g.applied_by=u.subject_id order by g.applied_on desc");
							while(rs.next())
							{
							
							%>
							<tr style="cursor:pointer" onclick="javascript:window.location='loadlodge.jsp?id=<%=rs.getString("id") %>'">
								<td width="202"><%=rs.getString("owner_name") %></td>
								<td><%=rs.getString("address") %></td>
								<td><%=rs.getString("loc_name") %></td>
								<td><%=rs.getString("user") %></td>
							</tr>
							<tr><td colspan="4"><hr/></td></tr>
							<%
									
							}
							}
							catch(Exception e)
							{
							out.println("Error"+e.getMessage());
							}
							 %>							
						</table>
							<table width="100%" >
							<tr><td colspan="4"><br/></td></tr>
							<tr>
								<td  style="font-size:18px" colspan="4"><font color=maroon><b>Mass Meeting	License Requests</b></font></td>
							</tr>
							<tr><td colspan="4"><br/></td></tr>
							<tr bgcolor=orange>
								<td><b>Reason</b></td>
								<td><b>Particulars</b></td>
								<td><b>Place</b></td>
								<td><b>Applied username</b></td>
							</tr>
							<tr><td colspan="4"><hr/></td></tr>
							<% 
							try
							{
							
							ResultSet rs=null;
							
							db.connect();
							rs=db.execSQL("select g.massid ,g.reason ,g.parti ,t.name as user,g.place from sakansha.massmeeting as g,sakansha.subject as u,xmltable('$c/all' passing u.details as \"c\" columns name varchar(100) path 'name')as t where g.status=2 and g.appliedby=u.subject_id order by g.appliedon desc");
							
							while(rs.next())
							{
						
							
							%>
							<tr style="cursor:pointer" onclick="javascript:window.location='loadmass.jsp?id=<%=rs.getString("id") %>'">
							
								<td><%=rs.getString("reason") %></td>
								<td><%=rs.getString("parti") %></td>
								<td><%=rs.getString("place") %></td>
								<td><%=rs.getString("user") %></td>
							</tr>
							<tr><td colspan="4"><hr/></td></tr>
							<%
									
							}
							}
							catch(Exception e)
							{
							out.println("Error"+e.getMessage());
							}
							 %>						
						</table>
							<table width="100%" >
							<tr><td colspan="4"><br/></td></tr>
							<tr>
								<td  style="font-size:18px" colspan="2"><font color=maroon><b>Loud Speaker License Requests</b></font></td>
							</tr>
							<tr><td colspan="4"><br/></td></tr>
							<tr bgcolor=orange>
								<td><b>Name of the Applicant</b></td>
								<td><b>Reason</b></td>
								<td><b>Location</b></td>
								<td><b>Applied Username</b></td>
							
							</tr>
							<tr><td colspan="3"><hr/></td></tr>
							<% 
							try
							{
							
							ResultSet rs=null;
							
							db.connect();
							rs=db.execSQL("select g.loudid as id,g.username,g.reason,t.name as user,g.location from sakansha.loudspeaker as g,sakansha.subject as u,xmltable('$c/all' passing u.details as \"c\" columns name varchar(100) path 'name')as t where g.status=2 and g.appliedby=u.subject_id order by g.appliedon desc");
							while(rs.next())
							{
							
							%>
							<tr style="cursor:pointer" onclick="javascript:window.location='loadloud.jsp?id=<%=rs.getString("id") %>'">
								<td><%=rs.getString("username") %></td>
								<td><%=rs.getString("reason") %></td>
								<td><%=rs.getString("location") %></td>
								<td><%=rs.getString("user") %></td>
							</tr>
							<tr><td colspan="3"><hr/></td></tr>
							<%
									
							}
							}
							catch(Exception e)
							{
							out.println("Error"+e.getMessage());
							}
							 %>						
						</table></td></tr></table>
<jsp:include page='foot.jsp' flush="false"></jsp:include>
</body>
</html>