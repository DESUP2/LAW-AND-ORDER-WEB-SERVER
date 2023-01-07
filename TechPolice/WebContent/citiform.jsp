<DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<%@page language="java" import="java.util.Date" %>
 <%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
  <%@page import="java.util.Date" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="techfiles/othervalids.js"></script>
<link href="css/dropdown-menu.css" rel="stylesheet" type="text/css" />
<jsp:useBean id="db" class="database.dncon" />
<title>Citizen Sign Ups Today| LAW &amp; ORDER</title>
</head>

<body>

      
        <script type="text/javascript" src="techfiles/othervalids.js"></script>
    
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        
        <table align="center"><tr><td><h2><font color=teal>Citizen Approval/Rejection Form</font></h2></td></tr></table>
       <%

try
{
		String responseText=new String("");
		String q= request.getParameter("q");
		String sub=request.getParameter("from");
		
		
		db.connect();

				 ResultSet rs=null;
				 
				 rs=db.execSQL("select i.rejection_reason,t.name,t.fathername,t.date,t.month,t.year,t.address,i.time,p.proofname,a.loc_name,pe.status,i.subject_id,l.username,i.proof,i.prooftype,i.persmission from sakansha.subject as i,sakansha.proofs as p,sakansha.location as a,sakansha.allowance as pe,sakansha.signin as l,xmltable('$c/all' passing i.details as \"c\" columns name varchar(100) path 'name',fathername varchar(100) path 'fathername',date varchar(2) path 'date',month varchar(2) path 'month',year varchar(4) path 'year',address varchar(1000) path 'address') as t where i.persmission=pe.id and p.id=i.prooftype and i.area=a.LOC_ID and l.id='"+q+"' and i.subject_id='"+q+"'");
				
				responseText+="<table width='100%' cellspacing='5' cellpadding='5'>";
				
				 while(rs.next())
				 {
				 responseText+="<tr ><td width='50%'>Name</td><td width='50%'>"+rs.getString("name")+"</td></tr>";
				 responseText+="<tr><td>Father Name</td><td>"+rs.getString("fathername")+"</td></tr>";
				 String[] monthName = {"zero","January", "February",
            "March", "April", "May", "June", "July",
            "August", "September", "October", "November",
            "December"};
 
        
        String month = monthName[Integer.parseInt(rs.getString("month"))];
				 
				 responseText+="<tr><td>Date of Birth</td><td>"+rs.getString("date")+"/"+month+"/"+rs.getString("year")+"</td></tr>";
				 responseText+="<tr><td>Area</td><td>"+rs.getString("loc_name")+"</td></tr>";
				 responseText+="<tr><td>Time</td><td>"+rs.getString("time")+"</td></tr>";
				 responseText+="<tr><td>Address</td><td>"+rs.getString("address")+"</td></tr>";
				
				 
				 responseText+="<tr><td>Email</td><td>"+rs.getString("username")+"</td></tr>";
				 //String var="";
				 
				 
					 if(Integer.parseInt(rs.getString("prooftype"))==5)
					 {
					 responseText+="<tr><td>"+rs.getString("proofname")+" </td><td><a target='_blank' href='http://localhost:9081/TechPolice/upload/"+rs.getString("proof")+"'>Click here</a></td></tr>";
					 }
					 else
					 {
					 responseText+="<tr><td>"+rs.getString("proofname")+" Number</td><td>"+rs.getString("proof")+"</td></tr>";
					 }
							if(Integer.parseInt(rs.getString("persmission"))==0)
							  {
							 responseText+="<tr><td colspan='2'><span id='buttons'><button onclick=\"approve(1,"+rs.getString("subject_id")+",'notapplicable')\">Approve</button><button onclick=\"javascript:showreason("+rs.getString("subject_id")+")\">Reject</button></span> </td></tr>";
							 }
							 if(Integer.parseInt(rs.getString("persmission"))==2)
							  {
							 responseText+="<tr><td>Rejection Reason</td><td>"+rs.getString("rejection_reason")+"</td></tr>";
							 }
				 
				 }
				//if(Integer.parseInt(from)==1)
				//{
					responseText+="<tr><td><a onclick=\"citizensignup("+sub+")\" style='cursor:pointer'>Back to Results</a></td></tr>";
				//}

		 responseText+="</table>";
	  	out.print(responseText);

	
	
  	db.close();
 
 } 
 catch(Exception e)
	{
		out.println("Error "+e.getMessage());
		
	}
	
%>

<jsp:include page='foot.jsp' flush="false"></jsp:include>
</body>
</html>