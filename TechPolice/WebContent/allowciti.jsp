<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>allowciti</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<%@page language="java" import="java.sql.*" %>
<jsp:useBean id="db" class="database.dncon" />
<jsp:useBean id="mail" class="database.mail" />


<%

try
{
		String q=(String)request.getParameter("q");
		String user=(String) request.getParameter("user");
		String reason=(String) request.getParameter("reason");
		
		db.connect();
		
		String query="";
		
		
		query="update sakansha.subject set persmission="+q+",approved_by="+session.getAttribute("id")+",approved_on=current_timestamp,rejection_reason='"+reason+"' where subject_id="+user;
		db.updateSQL(query);
		
	ResultSet rs=db.execSQL("select i.username,i.password from sakansha.signin as i where i.id="+user);
		String email=rs.getString("username");
		String pass=rs.getString("password");
		while(rs.next())
		{
				 String  subject="Account Activated";
												String message="<html><head></head><body><table>"
										     	+"<tr><td><h1>Account Activated At LAW & ORDER AUTOMATION</h1></td></tr>"
										   	+"<tr><td><strong> Your Signup request is accepted and activated. You can login and use the services of LAW & ORDER AUTOMATIOM. </strong></td></tr>"
										    	+"<tr><td></td></tr>"
										   	+"<tr><td>Your account details <br/> </td></tr>"
										   	+"<tr><td>Username (Email) : "+email+" </td></tr>"
										   	+"<tr><td>Password  : "+rs.getString("password")+" </td></tr>"      	      	
										   	+"</table></body></html>";
											mail.GmailSend(email,subject,message); 
											}
				 
				 String responseText="<table align=center><tr><td><img src='images/status.png' alt='correct'/></td><td>Done</td></tr></table>";
				  
out.print(responseText);
	
	
  	db.close();
 
 } 
 catch(Exception e)
	{
		System.out.println("Error "+e.getMessage());
		
	}
	
%>


</body>
</html>