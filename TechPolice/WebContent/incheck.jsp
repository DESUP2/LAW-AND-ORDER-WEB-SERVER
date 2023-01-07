<%@page language="java" import="java.sql.*" %>
<jsp:useBean id="mail" class="database.mail" />
<jsp:useBean id="db" class="database.dncon" />
<html>   
<head><title>Database connection</title></head>  
<body>
<center>  
 
<hr>  
<br><br>  


<% 
	String username=request.getParameter("email");
	String password=request.getParameter("pass");
	String usertype=request.getParameter("usertype");
	db.connect();

   ResultSet rs = null ; 
   
   
   
			try 
				{ 
			         rs = db.execSQL("select ID,PASSWORD,USERTYPE,CONFIRM,USERNAME from SAKANSHA.SIGNIN where usertype="+usertype+" and username='"+username+"'");  
					if(rs.next())
					{
						if(rs.getString("password").equals(password))
						{
										if(rs.getString("CONFIRM").equals("1"))
										{
												session.setAttribute("id",rs.getString("id"));
												session.setAttribute("login","1");
												session.setAttribute("usertype",rs.getString("usertype"));
												//Password is correct
												
											%><jsp:forward	page="index.jsp"></jsp:forward><%
										}
										else
										{
											%><jsp:forward	page="in.jsp?err=Your ID is temporarily withdrawn."></jsp:forward><%
										}
						}
						else
						{String  subject="Invalid Login Attempt";
												String message="   "
										      	+"  Invalid Login Attempt  "
										      	+"We found that someone has made an invalid login attempt with your email."
										      	+"If you mistyped the password, ignore this message.Else change your password to secure one."
										      	+"Your account details"
										      	+"   Username (Email) : "+username+"    "
										      	+"    Password  : "+rs.getString("password")+"  "      	      	
										      	+" ";
												mail.GmailSend(username,subject,message);
												
							%><jsp:forward	page="in.jsp?err=Invalid Password"></jsp:forward><%
						}
					}
					else
					{
							%><jsp:forward	page="in.jsp?err=Username does not exist"></jsp:forward><%
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

</HTML>