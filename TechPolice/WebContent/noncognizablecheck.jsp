<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page language="java" import="java.sql.*" %>
<%@page language="java" import="java.util.Date" %>
 <%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
  <%@page import="java.util.Date" %>
<html>
<head>
<title>Complaint | Law &amp; Order Automation</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<jsp:include page='head.jsp' flush="false"></jsp:include>
      
        
    
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        <script type="text/javascript" src="techfiles/dom.js"></script>
        <h1><font color=green>
		<%@page import="java.sql.*,java.util.*,java.text.*" %>
<jsp:useBean id="db" class="database.dncon" />

<%
try
{
db.connect();
String details=request.getParameter("details");

String complaint_id =request.getParameter("complaint_id");

ResultSet rs=null;
rs=db.execSQL("select count(id) as id,(select policestation from sakansha.policejob where p_ip="+session.getAttribute("id")+") from sakansha.noncognizable");
		while(rs.next())
		{
		// This loop is to select the FIR Number for next FIR
		// FIR number does not start with 1,2,3
		// Instead yyyy+pppp+ffffff where yyyy-current year, pppp-police station,fffff-number which increments by 1
		
	
			
			Calendar cal = Calendar.getInstance(); 
			int current = cal.get(Calendar.YEAR);
			
			
			DecimalFormat myFormat1 = new java.text.DecimalFormat("0000");
			String ps1=myFormat1.format(Integer.parseInt(rs.getString("POLICESTATION")));
			
			int co=Integer.parseInt(rs.getString("id"))+1;
			DecimalFormat myFormat = new java.text.DecimalFormat("000000");
			String firno1=myFormat.format(co);
			
			String a="N"+current+ps1+firno1;
			
		
		 String query="insert into sakansha.noncognizable(id,details,by,on,complaint_id,ps,no) values((select count(id)+1 from sakansha.noncognizable),'"+details+"',"+session.getAttribute("id")+",current_timestamp,"+complaint_id+","+rs.getString("policestation")+",'"+a+"')";
		db.updateSQL(query);
		if(!(complaint_id==null||complaint_id.equals("")))
		{
		String query1="update sakansha.complaints set status=3 where comp_id="+complaint_id;
		db.updateSQL(query1);
		}
		out.print("NonCognizable number is "+a);
		
		}
		db.close(); 
		

}
catch(Exception e)
{
out.print("Error"+e.getMessage());

}

%>
</h1></font> <span>Non Cognizable Filed.</span>

<jsp:include page='foot.jsp' flush="false"></jsp:include>

</body>
</html>