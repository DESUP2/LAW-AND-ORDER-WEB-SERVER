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
<script>

function checkform()
	{	

				
					
				if(document.RegistrationForm.to.value.length == 0)			
				{
					alert("Please enter the senders Id");	
					document.RegistrationForm.to.focus();
					return false;
				}
				
			if(document.RegistrationForm.subject.value.length == 0)			
				{
					alert("Please enter the subject");	
					document.RegistrationForm.subject.focus();
					return false;
				}
				if(document.RegistrationForm.msg.value.length == 0)			
				{
					alert("Please enter the message");	
					document.RegistrationForm.msg.focus();
					return false;
				}
				
				
				
		return true;
	}	
</script>
</head>
<body>
<jsp:include page='head.jsp' flush="false"></jsp:include>
      
        
    
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        
        <% 
						db.connect();
						ResultSet rs2=null;
						rs2=db.execSQL("select i.ID,i.USERNAME,NAME,SUBJECT_ID from SAKANSHA.SIGNIN as i,SAKANSHA.SUBJECT as k where i.ID="+session.getAttribute("id")+" and k.SUBJECT_ID="+session.getAttribute("id"));
						while(rs2.next())
						{
						%>
       
<center><h1> COMPOSE MAIL </h1></center> 
<table width='100%' border="0" >
	<tr>
		<td >
		<form method="post"     action="composecheck.jsp"  onclick="return checkform()" name="RegistrationForm" >

<table width='97%' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top' align="center">
<tr class="colour">
		<td><font> <%
							out.print(request.getParameter("err")); %></font></td>
<input type="hidden" name="from" value="<%=rs2.getString("USERNAME")%>"/>
<input type="hidden" name="name" value="<%=rs2.getString("NAME")%>"/><%} db.close(); %><% %>
		</tr>
	
	<tr>
		<td valign="top"><b>To (Email ID):</b> </td>
		<td><input type="text" name="to"/></td>
	</tr>
	<tr> 
		<td valign="top"><b>Subject:</b> </td>
		<td><input type="text" name="subject"/></td>
	</tr>
	<tr>
		<td valign="top"><b>Message:</b> </td>
		<td><textarea name="msg" id="f6" cols="40" rows="10"></textarea></td>
	</tr>
	<tr>
	<td></td><td><p style="visibility:hidden;" id="progress"><img id="progress_image" style="padding-left:5px;padding-top:5px;" src="../images/ajax-loader.gif" alt=""></img></p> </td>
	</tr>
	
</table>
<table width='97%' class="back" cellspacing='5' cellpadding="5"  style='text-align:center;vertical-align: top'>
	<tr>
		<td width="25%">&nbsp;</td>
		<td><input id="submit" type="submit"class="contSubmit"  value="Submit"/></td>
		<td><input type="reset" value="Reset"/></td>
		<td width="25%">&nbsp;</td>
		
	</tr>
	</table></form></td></tr></table>
	
	
	<jsp:include page='foot.jsp' flush="false"></jsp:include>

</body>
</html>