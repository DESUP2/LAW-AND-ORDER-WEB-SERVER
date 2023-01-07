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
<title>Case Files| LAW &amp; ORDER</title>

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
<script type="text/javascript" src="techfiles/dom.js"></script>
<body>
<jsp:include page='head.jsp' flush="false"></jsp:include>

<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        <script type="text/javascript" src="techfiles/dom.js"></script>
        
        <table  width='73%'><tr><td colspan='4'><strong>Case Files</strong></td></tr><tr><td align='center' style='valign:top'><input type="button" value="FIR Cases" onclick="seeallfir(1)"/></td><td align='center'><input type="button"  onclick="seeallfir(2)" value="Petty Cases" /></td><td align='center'></td><td></td></tr><tr><td colspan='4'><hr /></td></tr></table>
        <table width='100%'>
				<tr>
					<td width="50%" valign='top'>
					<table width="100%" cellspacing="6" cellpadding="6">
						<tr>
						
					<td width="50%" valign="top">
						
						<table width="100%" cellpadding="6"  cellspacing="6">
							<tr>
								<td  style="font-size:18px">Recent Pettycase Case Files</td>
							</tr>
							<% 
							try
							{
							ResultSet rs=null;
							
							db.connect();
						rs=db.execSQL("select t.date as d,t.reason,t.arresttime,t.name,t.sdhname,monthname(i.on) as month,day(i.on) as date,time(i.on) as time,year(i.on) as year  from sakansha.petty as i, xmltable('$c/pettycase' passing i.pettycase as \"c\" columns date varchar(100) path 'date',arresttime varchar(100) path 'arresttime',name varchar(100) path 'name',sdhname varchar(100) path 'sdhname',reason varchar(100) path 'reason') as t where i.id="+request.getParameter("id")+"");
							while(rs.next())
							{
							//to fetch recent fir cases
							%>
							<tr>
								<td>Time at which petty case was filed</td>
								<td><%=rs.getString("date") %> <%=rs.getString("month") %> <%=rs.getString("year") %> <%=rs.getString("time") %></td>
							</tr>
							<tr>
								<td colspan="2"><strong>Arrested person Details</strong></td>
								
							</tr>
							<tr>
								<td>Name</td>
								<td><%=rs.getString("name") %></td>
							</tr>
							<tr>
								<td>Father Name</td>
								<td><%=rs.getString("sdhname") %></td>
							</tr>
							<tr>
								<td>Reason For the Arrest</td>
								<td><%=rs.getString("reason") %></td>
							</tr>
							<tr>
								<td>Arrested Date</td>
								<td><%=rs.getString("d") %></td>
							</tr>
							<tr>
								<td>Arrested time</td>
								<td><%=rs.getString("time") %></td>
							</tr>														
							<%
							}
							}
							catch(Exception e)
							{
							out.println("Error"+e.getMessage());
							}
							 %>							
						</table>
					</td>
				</tr>
				
				
			</table>
        </td></tr></table>
<jsp:include page='foot.jsp' flush="false"></jsp:include>
</body>
</html>