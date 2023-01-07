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
		
		rs1=db.execSQL("select c.area,o.p_ip from sakansha.policejob as o,sakansha.power as c where o.policestation=c.policestation and o.p_ip="+session.getAttribute("id"));
		
		responseText+="<table width='100%' cellspacing='0'  >";
		 responseText+="<tr bgcolor=orange><td style='padding-left:5px'><strong></strong></td><td><strong>Agency Name</strong></td><td><strong>Area</strong></td><td></td><td><strong>Time</strong></td><td><strong>Status</strong></td></tr>";
		 responseText+="<tr><td colspan='6'><hr/></td></tr>";
		 ResultSet rs=null;
		while(rs1.next())
		{

				
				
				 if(Integer.parseInt(q)==1)
				 {
				 
				 rs=db.execSQL("select i.agency,a.loc_name,pe.status,i.id,i.time from sakansha.detectives as i,sakansha.location as a,sakansha.allowance as pe where i.flag=0 and i.flag=pe.id  and i.area="+rs1.getString("area")+" and a.loc_id="+rs1.getString("area"));
				 }
				 if(Integer.parseInt(q)==2)
				 {
				 
				 
				 rs=db.execSQL("select i.agency,a.loc_name,pe.status,i.id,i.time from sakansha.detectives as i,sakansha.location as a,sakansha.allowance as pe where i.flag=1 and i.flag=pe.id  and i.area="+rs1.getString("area")+" and a.loc_id="+rs1.getString("area"));
				 }
				 if(Integer.parseInt(q)==3)
				 {
				 
				 
				 rs=db.execSQL("select i.agency,a.loc_name,pe.status,i.id,i.time from sakansha.detectives as i,sakansha.location as a,sakansha.allowance as pe where i.flag=2 and i.flag=pe.id  and i.area="+rs1.getString("area")+" and a.loc_id="+rs1.getString("area"));
				 }
				  if(Integer.parseInt(q)==4)
				 {
				 //show all signups
				 
				 rs=db.execSQL("select i.agency,a.loc_name,pe.status,i.id,i.time from sakansha.detectives as i,sakansha.location as a,sakansha.allowance as pe where i.flag=pe.id  and i.area="+rs1.getString("area")+" and a.loc_id="+rs1.getString("area"));
				 }
				 if(Integer.parseInt(q)==5)
				 {
				 //show only rejected signups
				 
				 rs=db.execSQL("select i.agency,a.loc_name,pe.status,i.id,i.time from sakansha.detectives as i,sakansha.location as a,sakansha.allowance as pe where i.flag=3 and i.flag=pe.id  and i.area="+rs1.getString("area")+" and a.loc_id="+rs1.getString("area"));
				 }
				 
				 
			
				  
				 while(rs.next())
				 {
				 responseText+="<tr style='cursor:pointer' onclick='viewdetectivesignup("+rs.getString("id")+","+q+");'><td></td><td>"+rs.getString("agency")+"</td><td>"+rs.getString("loc_name")+"</td><td></td><td>"+rs.getString("time")+"</td><td>"+rs.getString("status")+"</td> </tr>";		
				  responseText+="<tr><td colspan='6'><hr/></td></tr>";
						
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