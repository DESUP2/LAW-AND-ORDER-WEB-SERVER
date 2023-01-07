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
		
		
		query="update sakansha.detectives set flag="+q+",rejection='"+reason+"',approved_by="+session.getAttribute("id")+",approved_on=current_timestamp where id="+user;
		
				 
				 db.updateSQL(query);
				 String responseText="<img src='images/status.png' alt='correct'/>Done";
				  
out.print(responseText);
	
	
  	db.close();
 
 } 
 catch(Exception e)
	{
		System.out.println("Error "+e.getMessage());
		
	}
	
%>