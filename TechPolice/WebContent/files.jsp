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
        
        <table  align="center"><tr><td colspan='4'><strong>Case Files</strong></td></tr><tr><td align='center' style='valign:top'><input type="button" value="FIR Cases" onclick="seeallfir(1)"/></td><td align='center'><input type="button"  onclick="seeallfir(2)" value="Petty Cases" /></td><td align='center'></td><td></td></tr><tr><td colspan='4'><hr /></td></tr></table>


<table width='100%'>
				<tr>
					<td width="50%" valign='top'>
					<table width="100%" cellspacing="6" cellpadding="6">
						<tr>
						<td height="63">
							<input type='button' value='Make a New FIR' onclick="javascript:window.location='fir.jsp?id=&complaint='" size='2'/>
							
						</td>
						</tr>
						<tr>
							<td height="16">
							
							</td>
						</tr>
						<tr>
						<td height="62">
							<input type='button' value='Make a New Petty Case' onclick="javascript:window.location='fir.jsp?id=&complaint='"/>
						</td>
						</tr>
						<tr>
						<td height="52">
							Petty Cases are those which can filed for minor crimes. Usually the criminal is realeased in one or two days.
						</td>
						</tr>
					</table>
					</td>
					<td width="50%" valign="top">
						<table width="100%" cellpadding="6"  cellspacing="6">
							<tr>
								<td  style="font-size:18px">Recent FIR Case Files</td>
							</tr>
							<% 
							try
							{
							
							ResultSet rs=null;
							
							db.connect();
							rs=db.execSQL("select f.id,f.fir from sakansha.fir_details as f where f.policestation=(select policestation from sakansha.policejob where p_ip="+session.getAttribute("id")+") order by on desc fetch first 4 rows only ");
							while(rs.next())
							{
							//to fetch recent fir cases
							ResultSet rs1=db.execSQL("select id from sakansha.cases where fir="+rs.getString("id"));
							while(rs1.next())
								{
							%>
							<tr>
								<td><a href='vfir.jsp?id=<%=rs1.getString("id") %>'><%=rs.getString("fir") %></a></td>
							</tr>
							<%
									}
							}
							}
							catch(Exception e)
							{
							out.println("Error"+e.getMessage());
							}
							 %>							
						</table>
						<table width="100%" cellpadding="6"  cellspacing="6">
							<tr>
								<td  style="font-size:18px">Recent Pettycase Case Files</td>
							</tr>
							<% 
							try
							{
							ResultSet rs=null;
							
							db.connect();
							rs=db.execSQL("select p.id,p.no from sakansha.petty as p where p.policestation=(select policestation from sakansha.policejob where p_ip="+session.getAttribute("id")+") order by on desc fetch first 4 rows only");
							while(rs.next())
							{
							//to fetch recent fir cases
							%>
							<tr>
								<td><a href='vpetty.jsp?id=<%=rs.getString("id") %>'><%=rs.getString("no") %></a></td>
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
			<table align="center"><tr><td><span id="listall"></span></td></tr></table>

<jsp:include page='foot.jsp' flush="false"></jsp:include>
</body>
</html>