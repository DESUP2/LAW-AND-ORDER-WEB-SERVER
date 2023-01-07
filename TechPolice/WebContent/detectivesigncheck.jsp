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
<link href="css/dropdown-menu.css" rel="stylesheet" type="text/css" />
<jsp:useBean id="db" class="database.dncon" />
<title>Detective SignUps| LAW &amp; ORDER</title>
</head>

<body>

      
        
    
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        
        <%

try
{
		String responseText=new String("");
		String q=(String) request.getParameter("q");
		String from=(String) request.getParameter("from");

		
		db.connect();
//out.print(q);
				 ResultSet rs1=null;
				 rs1=db.execSQL("select i.rejection,t.name,t.fathername,t.date,t.month,t.year,t.address,i.area,a.loc_id,i.agency,i.time,i.members,a.loc_name,pe.status,pe.id,i.id,i.flag from sakansha.detectives as i,sakansha.location as a,sakansha.allowance as pe ,xmltable('$c/all' passing i.detective as \"c\" columns name varchar(100) path 'name',fathername varchar(100) path 'fathername',date varchar(2) path 'date',month varchar(2) path 'month',year varchar(4) path 'year',address varchar(1000) path 'address') as t where i.flag=pe.id and i.area=a.loc_id and i.id="+q);
				 
				responseText+="<table width='100%'>";
				//out.print("Going to find..");
				 while(rs1.next())
				 {out.print(from);
				 responseText+="<tr ><td colspan='2'><strong>Detective Agency Details</strong></td></tr>";
				 responseText+="<tr ><td width='50%'>Agency Name</td><td width='50%'>"+rs1.getString("agency")+"</td></tr>";
				 responseText+="<tr><td>Members in the agency</td><td>"+rs1.getString("members")+"</td></tr>";				 
				 responseText+="<tr><td>Address</td><td>"+rs1.getString("address")+"</td></tr>";
				 responseText+="<tr><td>Area</td><td>"+rs1.getString("loc_name")+"</td></tr>";
				 responseText+="<tr ><td colspan='2'><strong>Detective Details (Incharge person of detective agency)</strong></td></tr>";
				 responseText+="<tr ><td width='50%'>Name</td><td width='50%'>"+rs1.getString("name")+"</td></tr>";
				 responseText+="<tr><td>Father Name</td><td>"+rs1.getString("fathername")+"</td></tr>";
				 String[] monthName = {"zero","January", "February",
            "March", "April", "May", "June", "July",
            "August", "September", "October", "November",
            "December"};
 
        
        String month = monthName[Integer.parseInt(rs1.getString("month"))];
				 
				 responseText+="<tr><td>Date of Birth</td><td>"+rs1.getString("date")+"/"+month+"/"+rs1.getString("year")+"</td></tr>";
				
				 responseText+="<tr><td>Time of signup</td><td>"+rs1.getString("time")+"</td></tr>";
				 
				if(Integer.parseInt(rs1.getString("flag"))==0)
							  {
							 responseText+="<tr><td colspan='2'><span id='buttons'><button onclick=\"approvedetective(1,"+rs1.getString("id")+",'notapplicable')\">Approve</button><button onclick=\"javascript:showdetectivereason("+rs1.getString("id")+","+from+")\">Reject</button><button onclick=\"javascript:approvedetective(3,"+rs1.getString("id")+",'Not applicable for pending')\">Pending</button></span> </td></tr>";
							 }
							 if(Integer.parseInt(rs1.getString("flag"))==2)
							  {
							 responseText+="<tr><td>Rejection Reason</td><td>"+rs1.getString("rejection")+"</td></tr>";
							 }
								if(Integer.parseInt(rs1.getString("flag"))==3)
							  {
							 responseText+="<tr><td colspan='2'><span id='buttons'><button onclick=\"approvedetective(1,"+rs1.getString("id")+",'notapplicable')\">Approve</button><button onclick=\"javascript:showdetectivereason("+rs1.getString("id")+","+from+")\">Reject</button></span> </td></tr>";
							 }
				 
				 
				 //String var="";
				 
				 
					 
							
				 
				 }
				
					 responseText+="<tr><td><a onclick=\"detectivesignup("+from+")\" style='cursor:pointer'><h6>Back</h6></a></td></tr>";
				

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