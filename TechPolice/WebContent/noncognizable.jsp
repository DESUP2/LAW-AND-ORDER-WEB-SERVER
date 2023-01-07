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
<script>
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
	
	 </script>
	 <script>
function checkform1()
	{	
	
		var msg = validateField(document.RegistrationForm.details,'STRING','5','1000','Details of case','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.details.focus();
					return false;
				}
				
	return true;
	}	



}
</script>
<jsp:include page='head.jsp' flush="false"></jsp:include>
      
        
    
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        <script type="text/javascript" src="techfiles/dom.js"></script>
       
       
<form name='RegistrationForm' action='noncognizablecheck.jsp' method="post" onsubmit="return checkform1()">
<table width='100%' align="center"'text-align:left;vertical-align: top'>
  				<tr>
					<td colspan='4' align='center'><h2 >Non Cognizable Case</h2></td>
			
				</tr>
	
		
		
			
	<tr class='colour'>
		<td colspan='4'><b>Complainant Information</b></td>
	</tr>
	<tr>
		<td>Any other details on regarding that complaint<span class='style3'>*</span></td>
		<td colspan='2'><textarea name='details' title='Please enter the summary of FIR' cols='46' rows='5'></textarea></td>	
	</tr>
	

</table>
<table width='97%'  cellspacing='5' cellpadding='5'  style='text-align:center;vertical-align: top'>
	<tr>
		<td width='25%'>&nbsp;</td>
		<td><input type="submit" value="Submit" value="Submit" /><input type="hidden" name="complaint_id" value="<%=request.getParameter("id") %>" /></td>
		<td><input type='reset' value='Reset'/></td>
	</tr>
	</table></form>
	<jsp:include page='foot.jsp' flush="false"></jsp:include>
</body>
</html>