<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>complaintsview</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<%@page language="java" import="java.sql.*" %>
<jsp:useBean id="db" class="database.dncon" />
<%if(session.getAttribute("login")==null)
  { %>
 <jsp:forward	page="in.jsp"><jsp:param name="err" value="You must login first or sign up to use our services." /></jsp:forward>
   <%}
   else
{
	session.setAttribute("id",session.getAttribute("id"));
}
 %> 

<%

try
{
		String responseText=new String("");
		String q=(String) request.getParameter("q");
		String from=(String) request.getParameter("from");
		
		db.connect();

				 ResultSet rs=null;
				 ResultSet rs1=null;
				 rs=db.execSQL("SELECT complaint.comp_text,complaint_type.typename,comp_type.type as type1,complaint.comp_on,area.loc_name,complaint.comp_by,complaint.ip,complaint.emergency ,complaint.comp_id FROM sakansha.location AS AREA, sakansha.COMPLAINTs AS COMPLAINT, sakansha.COMPLAINTs_CHECK AS COMPLAINT_STATUS, sakansha.COMPLAINTs_TYPE AS COMPLAINT_TYPE, sakansha.COMP_TYPE AS COMP_TYPE  WHERE AREA.LOC_ID = COMPLAINT.AREA AND COMPLAINT_STATUS.ID = COMPLAINT.STATUS AND COMPLAINT_TYPE.ID = COMPLAINT.EMERGENCY AND COMP_TYPE.ID = COMPLAINT.TYPE  and complaint.comp_id="+q);
				 
				responseText+="<table width='100%' cellspacing='5' cellpadding='5'>";
				responseText+="<tr ><td width='50%'><strong>Complaint Information</strong></td></tr>";
				 while(rs.next())
				 {
				 responseText+="<tr ><td width='50%'>Complaint</td><td width='50%'>"+rs.getString("comp_text")+"</td></tr>";
				 responseText+="<tr><td>Type of Complaint</td><td>"+rs.getString("typename")+"</td></tr>";
				 responseText+="<tr><td>Classification of complaint</td><td>"+rs.getString("type1")+"</td></tr>";
				 responseText+="<tr><td>Complained Ip</td><td>"+rs.getString("ip")+"</td></tr>";
				 responseText+="<tr><td>Complained Time</td><td>"+rs.getString("comp_on")+"</td></tr>";
				 responseText+="<tr><td><font color=red>Hint :</font></td><td><font color=red>Police officer can use IP address and complaint time to find the exact location of complainant in the case of fake complaints</font></td></tr>";
				 responseText+="<tr><td>Area</td><td>"+rs.getString("loc_name")+"</td></tr>";
				 
				responseText+="<tr ><td width='50%'><strong>Complainant Information</strong></td></tr>";
				
				if(Integer.parseInt(rs.getString("emergency"))==1)
				{
				
				responseText+="<tr ><td colspan='2'><strong>The identities of complainant is not shown when he makes an emergency complaint.<br/>If Anonymous person uses this service wrongly he can be tracked via his IP</strong></td></tr>";
				
				}
				
				else if(Integer.parseInt(rs.getString("emergency"))==2)
				{
				
				rs1=db.execSQL("select t.name,t.fathername,t.date,t.month,t.year,t.address,i.time,a.loc_name,i.subject_id,l.username,t.mobileno,t.phoneno from sakansha.subject as i,sakansha.location as a,sakansha.signin as l,xmltable('$c/all' passing i.details as \"c\" columns name varchar(100) path 'name',fathername varchar(100) path 'fathername',date varchar(2) path 'date',month varchar(2) path 'month',year varchar(4) path 'year',address varchar(1000) path 'address',phoneno varchar(15) path 'phoneno',mobileno varchar(15) path 'mobileno') as t where i.area=a.loc_id and  l.id="+rs.getString("comp_by")+" and i.subject_id="+rs.getString("comp_by"));
				 
				while(rs1.next())
				{
				 responseText+="<tr><td>Name</td><td>"+rs1.getString("name")+"</td></tr>";
				 responseText+="<tr><td>Name</td><td>"+rs1.getString("fathername")+"</td></tr>";
				  String[] monthName = {"zero","January", "February",
            "March", "April", "May", "June", "July",
            "August", "September", "October", "November",
            "December"};
 
        
        String month = monthName[Integer.parseInt(rs1.getString("month"))];
				 responseText+="<tr><td>Date of Birth</td><td>"+rs1.getString("date") +" "+month+" "+rs1.getString("year")+"</td></tr>";
				  responseText+="<tr><td>Address</td><td>"+rs1.getString("address")+"</td></tr>";
				  responseText+="<tr><td>Area</td><td>"+rs1.getString("loc_name")+"</td></tr>";
				  responseText+="<tr><td>Phone Number (if any)</td><td>"+rs1.getString("phoneno")+"</td></tr>";
				  responseText+="<tr><td>Mobile Number (if any)</td><td>"+rs1.getString("mobileno")+"</td></tr>";				  
				  responseText+="<tr><td>Email</td><td>"+rs1.getString("username")+"</td></tr>";
				}
				}
				
				 //String var="";
				 
				responseText+="<tr><td colspan='2'><strong>Next Steps</strong> </td></tr>";		
				responseText+="<tr><td colspan='2'>Make an FIR : This makes an FIR with this complaint and it is redirected to Station House Officer. Station House Officer then decides who has to do the investigation. <br/></td></tr>";		
				responseText+="<tr><td colspan='2'>Petty Case : This complaint will be entered in petty case register. And information can be added in petty case register.<br/> </td></tr>";		
				responseText+="<tr><td colspan='2'>Non-Cognizable : This complaint will be entered in non cognizable register.<br/><strong> Non Cognizable means it is not worth for neither FIR nor Petty case</strong><br/> </td></tr>";		
				
				responseText+="<tr><td colspan='2'><span id='buttons'><input type='button' onclick=\"javascript:window.location='fir.jsp?id="+rs.getString("comp_id")+"&complaint="+rs.getString("comp_text")+"'\" value='Make a FIR'><input type='button' onclick=\"javascript:window.location='pettycase.jsp?id="+rs.getString("comp_id")+"&complaint="+rs.getString("comp_text")+"'\" value='Make Petty case' /><input type='button' value='Non Cognizable Case' onclick=\"javascript:window.location='noncognizable.jsp?id="+rs.getString("comp_id")+"'\" /> </span></td></tr>";							 
					
							
				 
				 }
				//if(Integer.parseInt(from)==1)
				//{

				//}
				
				
				
				
					responseText+="<tr><td><br/><a  onclick=\"complaints("+from+")\" style='cursor:pointer'><h6>Done</h6></a></td></tr>";				
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