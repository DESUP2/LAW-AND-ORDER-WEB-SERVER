<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>allfir</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<%@page language="java" import="java.sql.*" %>
<jsp:useBean id="db" class="database.dncon" />


<%

try
{
		String responseText=new String("");
		String q=(String) request.getParameter("q");
		
		
		db.connect();

				
							responseText+="<table width='100%' cellspacing='5' cellpadding='5'>";
				
							ResultSet rs=null;
				if(Integer.parseInt(q)==1)
				{
							responseText+="<tr ><td width='50%'><strong>FIR Filed In Your Police Station</strong></td></tr>";
							rs=db.execSQL("select f.id as fir,f.fir,a.id as case from sakansha.fir_details as f,sakansha.cases as a where  a.fir=f.id and f.policestation=(select policestation from sakansha.policejob where p_ip="+session.getAttribute("id")+")  order by on desc");
							while(rs.next())
							{
				 
				
									responseText+="<tr ><td width='100%'><a href='vfir.jsp?id="+rs.getString("case")+"'>"+rs.getString("fir")+"</td></tr>";
							 
						
							 
							 }
			
				}
				else if(Integer.parseInt(q)==2)
				{
							
							responseText+="<tr ><td width='50%'><strong>Petty Cases Filed In Your Police Station</strong></td></tr>";
							rs=db.execSQL("select p.id,p.no from sakansha.petty as p where p.policestation=(select policestation from sakansha.policejob where p_ip="+session.getAttribute("id")+") order by on desc");
							while(rs.next())
							{
				 
				
									responseText+="<tr ><td width='50%'><a href='vpetty.jsp?id="+rs.getString("id")+"'>"+rs.getString("no")+"</a></td></tr>";
							 
						
							 
							 }
				
				}
					responseText+="<tr><td><br/><a  href='files.jsp' style='cursor:pointer'>Back </a></td></tr>";				
		 responseText+="</table>";
	  	out.print(responseText);

	
	
  	db.close();
 
 } 
 catch(Exception e)
	{
		out.println("Error "+e.getMessage());
		
	}
	
%>

</body>
</html>