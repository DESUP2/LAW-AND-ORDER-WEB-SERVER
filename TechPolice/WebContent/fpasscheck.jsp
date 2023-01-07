<jsp:useBean id="mail" class="database.mail" />
<jsp:useBean id="db" class="database.dncon" />
<%@page import="java.util.*,java.sql.*" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US" xml:lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="GENERATOR" content="IBM WebSphere Studio"/>
<meta http-equiv="Content-Style-Type" content="text/css"/>


<title>Forgotten Password</title>
</head>
<body >

<center>  
 



<% 
	String username=request.getParameter("email");

	db.connect();

   ResultSet rs = null ; 
   
   
   
			try 
				{ 
			        
										
												rs=db.execSQL("select * from SAKANSHA.SIGNIN where username='"+username+"'");
												if(rs.next())
											{
												String  subject="Your Password Details";
												String message="<html><head></head><body><table>"
										      	+"<tr><td><h1>Your Password</h1></td></tr>"
										      
										      	+"<tr><td>Username (Email) : "+username+" </td></tr>"
										      	+"<tr><td>Password  : "+rs.getString("password")+" </td></tr>"      	      	
										      	+"Use URL  :: <h1>http://localhost:9081/TechLaw/detectives/signin.jsp</h1>"+"</table></body></html>";
												mail.GmailSend(username,subject,message);
												%><jsp:forward	page="fpass.jsp?err=You details are sent to your ID"></jsp:forward><%
											}
												else
												{
													%><jsp:forward	page="fpass.jsp?err=Username Not Found"></jsp:forward><%
												}
												


										
										         
          		}
          
        	catch(Exception e)
        		 { 
              		out.print("Error"+e.getMessage());        
              	 }  
    

   db.close();

%>



</center>

</body>

</html>