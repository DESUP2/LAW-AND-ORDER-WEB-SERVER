<%@page language="java" import="java.sql.*,java.util.*,java.io.*,java.net.*,java.text.*" %>
<jsp:useBean id="db" class="database.dncon" />
<jsp:useBean id="mail" class="database.mail" />


<%@ page import="java.util.*" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US" xml:lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="GENERATOR" content="IBM WebSphere Studio"/>
<meta http-equiv="Content-Style-Type" content="text/css"/>

<script type="text/javascript" src="techfiles/ajax.js"></script>
<link href="style.css" rel="stylesheet" type="text/css" />


<title>contactcheck.</title>
</head>

<body>

<% 
	db.connect();
	String email=request.getParameter("email");
			String query="insert into SAKANSHA.CONTACT(ID,EMAIL,NAME,MESSAGE,POSTED_ON) values((select count(id)+1 from SAKANSHA.CONTACT),'"+request.getParameter("email")+"','"+request.getParameter("name")+"','"+request.getParameter("msg")+"',current_timestamp)";
			db.updateSQL(query);
		 		 String  subject="Thank you for your response at LAW & ORDER AUTOMATION";
												String message="  "
										     	+"<h1> Thank you for contacting us </h1>"
										     	+"     Your message is recieved  ."
										      	+"  "
										      	+"          Team : Techjustice"
										     	
										      	+  	      	
										      	"Thank you. ";
												mail.GmailSend(request.getParameter("email"),subject,message);
			db.close();
			 %>
			<jsp:forward	page="contact.jsp"><jsp:param name="err" value="Your mail is sent." /></jsp:forward>
		
</body>
</html>		