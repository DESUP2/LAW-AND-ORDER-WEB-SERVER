<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page language="java" import="java.sql.*" %>
<%@page language="java" import="java.util.Date" %>
 <%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
  <%@page import="java.util.Date" %>
<html>
<head>
<jsp:useBean id="db" class="database.dncon" />
<title>Complaints | LAW &amp; ORDER</title>

<script type="text/javascript" src="techfiles/dom.js"></script>
<script  type="text/javascript" language="javascript" >
function changecolor(a)
{

	
	 if(a==1)
		{
		
		
		
		document.getElementById("listall").innerHTML="";
		citizensignup(1);
		}
		if(a==2)
		{
		
		
		
		document.getElementById("listall").innerHTML="";
		detectivesignup(1);
		}
		if(a==3)
		{
		
		
		document.getElementById("listall").innerHTML="";
		complaints(1);
		}
	else
		{
		document.getElementById("listall").innerHTML="element"+a+" Loading...";
		}
	
	a='menu-item'+a;
	
	
		for(i=1;i<7;i++)
	{
	
	b="menu-item"+i;
	
	var elem=document.getElementById(b);
	elem.style.background="none";
	
	}
	
	var elem1 = document.getElementById(a);
	 elem.style.background = "#f3f3f3";
	
	 




}
</script>
</head>

<body>
<jsp:include page='head.jsp' flush="false"></jsp:include>
      
        
    
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        <script type="text/javascript" src="techfiles/dom.js"></script>
        
        <%

try
{
		String responseText=new String("");
		String q=(String) request.getParameter("q");
		db.connect();
// get the officers police station and  working area
		ResultSet rs1=null;		
		
		rs1=db.execSQL("select c.area from sakansha.policejob as o,sakansha.power as c where o.policestation=c.policestation and p_ip="+session.getAttribute("id"));
		
		responseText+="<table width='100%'  align=center >";
		 responseText+="<tr bgcolor=orange><td style='padding-left:5px'><strong></strong></td><td><strong>Complaint</strong></td><td><strong>Area</strong></td><td><strong>Type of complaint</strong></td><td><strong>Complained on</strong></td><td><strong>Complained By</strong></td></tr>";
		 responseText+="<tr><td colspan='6'><hr/></td></tr>";
		 ResultSet rs=null;
		while(rs1.next())
		{

				 if(Integer.parseInt(q)==1)
				 {
				 //show all complaints
				 rs=db.execSQL("SELECT *  FROM SAKANSHA.LOCATION AS AREA, SAKANSHA.COMPLAINTS AS COMPLAINT, SAKANSHA.COMPLAINTS_CHECK AS COMPLAINT_STATUS,sakansha.signin as i, SAKANSHA.COMPLAINTS_TYPE AS COMPLAINT_TYPE, SAKANSHA.COMP_TYPE AS COMP_TYPE  WHERE AREA.LOC_ID = COMPLAINT.AREA AND COMPLAINT_STATUS.ID = COMPLAINT.STATUS AND COMPLAINT_TYPE.ID = COMPLAINT.EMERGENCY AND COMP_TYPE.ID = COMPLAINT.TYPE  and i.ID=COMPLAINT.COMP_BY and complaint.area="+rs1.getString("area")+" and area.LOC_ID="+rs1.getString("area"));
				 }
				 if(Integer.parseInt(q)==2)
				 {
				 //show only emergency complaints
				 
				 rs=db.execSQL("SELECT *  FROM SAKANSHA.LOCATION AS AREA, SAKANSHA.COMPLAINTS AS COMPLAINT, SAKANSHA.COMPLAINTS_CHECK AS COMPLAINT_STATUS,sakansha.signin as i, SAKANSHA.COMPLAINTS_TYPE AS COMPLAINT_TYPE, SAKANSHA.COMP_TYPE AS COMP_TYPE  WHERE AREA.LOC_ID = COMPLAINT.AREA AND COMPLAINT_STATUS.ID = COMPLAINT.STATUS AND COMPLAINT_TYPE.ID = COMPLAINT.EMERGENCY AND COMP_TYPE.ID = COMPLAINT.TYPE and i.ID=COMPLAINT.COMP_BY and complaint.area="+rs1.getString("area")+"  and complaint.emergency=1 and area.LOC_ID="+rs1.getString("area"));
				 }
				 if(Integer.parseInt(q)==3)
				 {
				 //show only non-emergency complaints
				 
				 rs=db.execSQL("SELECT *  FROM SAKANSHA.LOCATION AS AREA, SAKANSHA.COMPLAINTS AS COMPLAINT, SAKANSHA.COMPLAINTS_CHECK AS COMPLAINT_STATUS,sakansha.signin as i, SAKANSHA.COMPLAINTS_TYPE AS COMPLAINT_TYPE, SAKANSHA.COMP_TYPE AS COMP_TYPE  WHERE AREA.LOC_ID = COMPLAINT.AREA AND COMPLAINT_STATUS.ID = COMPLAINT.STATUS AND COMPLAINT_TYPE.ID = COMPLAINT.EMERGENCY AND COMP_TYPE.ID = COMPLAINT.TYPE and i.ID=COMPLAINT.COMP_BY and complaint.area="+rs1.getString("area")+"  and complaint.emergency=2 and area.LOC_ID="+rs1.getString("area"));
				 }
				 
				 
				int r=1;
				  
				 while(rs.next())
				 {
				 responseText+="<tr style='cursor:pointer' onclick='javascript:viewcomplaint("+rs.getString("comp_id")+","+q+");'><td style='padding-left:5px'></td><td>"+rs.getString("comp_text")+"</td><td>"+rs.getString("loc_name")+"</td><td>"+rs.getString("typename")+"</td><td>"+rs.getString("comp_on")+"</td><td>"+rs.getString("username")+"</td></tr>";		
				  responseText+="<tr><td colspan='6'><hr/></td></tr>";
				 r=r++; 				
				 }
				 
				 
				
				
		}
		
		 responseText+="</table>";
	  	out.print(responseText);

	
	
  	db.close();
 
 } 
 catch(Exception e)
	{
		out.println("Error "+e.getMessage());
		
	}
	
%>
       <table align="right"><tr><td> <span><a onclick="javascript:history.back()" style="cursor:pointer">Back</a></span><br /></td></tr><tr><td><br/>&nbsp;<br /></td></tr></table>
<span id="listall"></span>

<jsp:include page='foot.jsp' flush="false"></jsp:include> 
       
</body>
</html>