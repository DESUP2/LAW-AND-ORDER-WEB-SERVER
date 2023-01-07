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
<script language="javascript" src="techfiles/mootools.v1.11.js"></script>
<script language="javascript" src="techfiles/nogray_time_picker_min.js"></script>
<script language="javascript">
	window.addEvent("domready", function (){
		
		var tp2 = new TimePicker('time3_picker', 'time_arrest', 'time2_toggler', {format24:true});
		
		
	});
	
</script>
<style>
	* {font-family:Arial, Helvetica, sans-serif;
		font-size:9pt;}
		
	/* table list */
	.table_list {border-collapse:collapse;
		border:solid #cccccc 1px;
		width:100%;}
	
	.table_list td {padding:5px;
		border:solid #efefef 1px;}
	
	.table_list th {background:#75b2d1;
		padding:5px;
		color:#ffffff;}
	
	.table_list tr.odd {background:#e1eff5;}
	
	.time_picker_div {padding:5px;
		border:solid #999999 1px;
		background:#ffffff;}
		
</style>


<body  >

<!--Script starts-->

<script  type="text/javascript" language="javascript" >

function checkform()
	{
			if(document.RegistrationForm.year.selectedIndex<1)
			{
				alert("Select year of arrested");
				document.RegistrationForm.year.focus();
				return false;
			}
			if(document.RegistrationForm.month.selectedIndex<1)
			{
				alert("Select month of arrested");
				document.RegistrationForm.month.focus();
				return false;
			}
			if(document.RegistrationForm.date.selectedIndex<1)
			{
				alert("Select date of arrested");
				document.RegistrationForm.date.focus();
				return false;
			}
			if(document.RegistrationForm.time_arrest.value.length == 0)			
				{
					alert("Enter time of arrested");	
					document.RegistrationForm.time_arrest.focus();
					return false;
				}
			var msg = validateField(document.RegistrationForm.name,'NAME','1','50','Arrested Person\'s Name','/\\@#^,&*~-$%!');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.name.focus();
					return false;
				}
			var msg1 = validateField(document.RegistrationForm.sdhname,'NAME','1','50','Arrested Person Father\'s Name','/\\@#^,&*~-$%!');
				if(msg1.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.sdhname.focus();
					return false;
				}
				msg = validateField(document.RegistrationForm.reason,'STRING','5','1000','Reason for Arrested','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.reason.focus();
					return false;
				}
		return true;
	}	
</script>
</head>


<body>
<jsp:include page='head.jsp' flush="false"></jsp:include>
      
        
    
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        <script type="text/javascript" src="techfiles/dom.js"></script>
        <form name='RegistrationForm' action='pettycheck.jsp' onsubmit="return checkform()" method="post">
        
        <table width='100%' cellspacing='5' cellpadding='5'  style='text-align:left;vertical-align: top'>
  				<tr>
					<td colspan='4' align='center'><h2 >Petty Case</h2></td>
			
				</tr>
	
		
				<tr>
			
		<td>Date of Arrest <span class='style3'>*</span></td>
	<td><select name="year" onchange="listdate(document.RegistrationForm.month.value,this.value)">
				<option value='0'>year</option>
				<%
			Date date=new Date();


			SimpleDateFormat simpleDateformat=new SimpleDateFormat("yyyy");
			int a=Integer.parseInt(simpleDateformat.format(date));
			for(int i=a;i>=1947;--i)
			{
			%>
			<option value='<%=i %>'><%=i %></option>
			<%
			}
			
			 %>
				</select>
				<select name='month' onchange='listdate(this.value,document.RegistrationForm.year.value)'>
				<option value='0'>mon</option>
				<option value='01'>jan</option>
				<option value='02'>feb</option>
				<option value='03'>mar</option>
				<option value='04'>apr</option>
				<option value='05'>may</option>
				<option value='06'>jun</option>
				<option value='07'>jul</option>
				<option value='08'>aug</option>
				<option value='09'>sep</option>
				<option value='10'>oct</option>
				<option value='11'>nov</option>
				<option value='12'>dec</option>
			</select> <span id='dateselDIV'>
					<select name='date'>
					<option>dd</option>
					</select> </span> 
		</td>
		<td>Time of arrest:<span class='style3'>*</span></td>
		<td >
			<input type="text" name="time_arrest" id="time_arrest" /> 
			<div id="time3_picker" class="time_picker_div"></div>
		</td>
		</tr>
			
	<tr class='colour'>
		<td colspan='4'><b>Arrested Person Information</b></td>
	</tr>
	<tr>
		<td style='width: 120px'>Name: <span class='style3'>*</span></td>
		<td><input type='text' name='name' maxlength='50'			title='Please enter the complainants name'/></td>
		<td>Son/Daughter/Husband of :<span class='style3'>*</span></td>
		<td><input type='text' name='sdhname' maxlength='50' title='Please enter the father/husband name' /></td>
	</tr>

	<tr>
		<td>Reason For Arrest<span class='style3'>*</span></td>
		<td colspan='2'><textarea name='reason' title='Please enter the summary of FIR' cols='46' rows='5'></textarea></td>	
	</tr>
	

</table>
<table width='97%'  cellspacing='5' cellpadding='5'  style='text-align:center;vertical-align: top'>
	<tr>
		<td width='25%'>&nbsp;</td>
		<td><input type="submit" value="Submit" value="Submit" /><input type="hidden" name="complaint_id" value="<%=request.getParameter("id") %>" /></td>
		<td><input type='reset' value='Reset'/></td>
	</tr>
	</table>
	<jsp:include page='foot.jsp' flush="false"></jsp:include>
        
</body>
</html>