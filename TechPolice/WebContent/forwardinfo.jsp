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
<script>

function checkform()
	{	

				if(document.RegistrationForm.state.selectedIndex<1)
				{
					alert("Select State To Send Info.");
					document.RegistrationForm.year.focus();
					return false;
				}
								
				if(document.RegistrationForm.dis.length == 0)			
				{
					alert("Please enter the district name");	
					document.RegistrationForm.time_occurance.focus();
					return false;
				}
				if(document.RegistrationForm.ps.length == 0)			
				{
					alert("Please enter the policestation");	
					document.RegistrationForm.time_occurance.focus();
					return false;
				}
				if(document.RegistrationForm.detail.length == 0)			
				{
					alert("Please enter the details to send");	
					document.RegistrationForm.time_occurance.focus();
					return false;
				}
		
				
		return true;
	}	
</script>
<jsp:include page='head.jsp' flush="false"></jsp:include>
      
        
    
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        <script type="text/javascript" src="techfiles/dom.js"></script>
        <table align="center"><tr><td><h2>Forward Info. To Other PS</h2></td></tr></table>
        <br><br>
        
         <form name='RegistrationForm' action='forwardinfocheck.jsp' method="post" onsubmit="return checkform()" enctype="multipart/form-data">
         
         <table width='100%'>
				<tr>
					
					<td width="100%" valign="top">Enter The State</td>
					<td><select name='state'>
										<option value='0'>Select</option>
										<option value='1'>Haryana</option>
										<option value='3'>Delhi</option>
										<option value='4'>Uttar Pradesh</option>
										<option value='5'>Madhya Pradesh</option>
										<option value='6'>Bihar</option>
									</select></td>
					</tr>
					<tr>
					<td width="100%" valign="top">Enter The District</td>
							<td><input type=text name='dis'>
									</td></tr>
									<tr>
					<td width="100%" valign="top">Enter The Police Station</td>
							<td><input type=text name='ps'>
									</td></tr>
									<tr><td width="100%" valign="top">Enter The Details</td>
							<td><textarea rows="3" cols="20" name="detail"></textarea>
									</td></tr>
									<tr>
								<td>Files To Attach</td>
								<td><input type="file" name="file" /></td></tr>
								
								
								</table>
								<table width='100%' cellspacing='5' cellpadding='5'  >
	<tr>
		<td width='25%'>&nbsp;</td>
		<td><input id='submit' type='submit' value='Send'/></td>
		<td><input type='reset' value='Reset'/></td>
		<td width='25%'>&nbsp;</td>
		
	</tr>
	
	</table>
								</form>
																<jsp:include page='foot.jsp' flush="false"></jsp:include>
									
</body>
</html>