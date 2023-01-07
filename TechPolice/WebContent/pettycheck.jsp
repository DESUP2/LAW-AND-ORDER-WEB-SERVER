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
<title>Complaints | LAW &amp; ORDER</title></head>

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



<body>
<jsp:include page='head.jsp' flush="false"></jsp:include>
      
        
    
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        <script type="text/javascript" src="techfiles/dom.js"></script>
        
        <%
try
{
String date=request.getParameter("date");
String month=request.getParameter("month");
String year=request.getParameter("year");
String time=request.getParameter("time_arrest");
String name=request.getParameter("name");
String sdhname=request.getParameter("sdhname");
String reason=request.getParameter("reason");

String[] monthName = {"zero","January", "February",
            "March", "April", "May", "June", "July",
            "August", "September", "October", "November",
            "December"};
 
        
        String monthname = monthName[Integer.parseInt(month)];

String pettycase="<pettycase>"
+"<date>"+monthname+"/"+date+"/"+year+"</date>"
+"<arresttime>"+time+"</arresttime>"
+"<name>"+name+"</name>"
+"<sdhname>"+sdhname+"</sdhname>"
+"<reason>"+reason+"</reason>"
+"</pettycase>";
db.connect();
//String complaint =request.getParameter("complaint");
String complaint_id =request.getParameter("complaint_id");

ResultSet rs=null;
rs=db.execSQL("select max(id) as id,(select policestation from sakansha.policejob where p_ip="+session.getAttribute("id")+") from sakansha.petty");
		while(rs.next())
		{
		
	
			
			Calendar cal = Calendar.getInstance(); 
			int current = cal.get(Calendar.YEAR);
			
			
			DecimalFormat myFormat1 = new java.text.DecimalFormat("0000");
			String ps1=myFormat1.format(Integer.parseInt(rs.getString("policestation")));
			
			int co=Integer.parseInt(rs.getString("id"))+1;
			DecimalFormat myFormat = new java.text.DecimalFormat("000000");
			String firno1=myFormat.format(co);
			
			String a="P"+current+ps1+firno1;
			
		
		String query="insert into sakansha.petty(id,pettycase,by,on,complaint_id,policestation,no) values((select max(id)+1 from sakansha.petty),'"+pettycase+"',"+session.getAttribute("id")+",current_timestamp,"+complaint_id+","+rs.getString("policestation")+",'"+a+"')";
		db.updateSQL(query);
		if(!(complaint_id==null||complaint_id.equals("")))
		{
		String query1="update sakansha.complaints set status=2 where comp_id="+complaint_id;
		db.updateSQL(query1);
		}
		out.print("<table align=center><tr><td><h1><font color=green>Pettycase number is "+a+"</font></h1></td></tr></table>");
		
		}
		db.close();
		

}
catch(Exception e)
{
out.print("Error"+e.getMessage());

}

%>
<table align="center"><tr><td><h3><font color=teal>Petty Case Was Filled Successfully</font></h3></td></tr></table>
<jsp:include page='foot.jsp' flush="false"></jsp:include>
</body>
</html>