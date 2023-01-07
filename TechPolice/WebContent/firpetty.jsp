<DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/dropdown-menu.css" rel="stylesheet" type="text/css" />
<jsp:useBean id="db" class="database.dncon" />
<title>FIR/Petty Cases| LAW &amp; ORDER</title>
</head>

<body>
<jsp:include page='head.jsp' flush="false"></jsp:include>
      
        
		<div id="content">
        
        
        <div id="content_top"></div>
        <div id="content_main">
        <table width="100%" align="center" cellpadding="6"  cellspacing="6" style="text-align:left">
							
							<% 
							try
							{
							
							ResultSet rs=null;
							
							db.connect();
							String query="select * from SAKANSHA.POLICE_DUTY as i where I.id="+session.getAttribute("id");
							rs=db.execSQL(query);
							while(rs.next())
							{
							
							%>
							<tr>
								<td><h1 style="display: inline">Recent FIR/Petty Cases</h1></td>
							</tr>
							<tr>
								<td valign="top"> 
								<table align=center width="100%" cellpadding="6"  cellspacing="6">
							<tr>
								<td  style="font-size:18px">Recent FIR </td>
							</tr>
							<% 
							try
							{
							
							ResultSet rs2=null;
							
							db.connect();
							rs2=db.execSQL("select f.id,a.id,a.POLICE_STATION,f.fir from SAKANSHA.FIR_DETAILS as f ,SAKANSHA.POLICE_DUTY as a where f.POLICESTATION= a.POLICE_STATION and a.id= '"+session.getAttribute("id")+"' order by on desc fetch first 3 rows only ");
							while(rs2.next())
							{
							//to fetch recent fir cases
							ResultSet rs1=db.execSQL("select id from SAKANSHA.CASES where fir="+rs2.getString("id"));
							while(rs1.next())
								{
							%>
							<tr>
								<td><a href='vfir.jsp?id=<%=rs1.getString("id") %>'><%=rs2.getString("fir") %></a></td>
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
								</td>
								<td valign="top">
								<table width="100%" cellpadding="6"  cellspacing="6">
							<tr>
								<td  style="font-size:18px">Recent Pettycase</td>
							</tr>
							<% 
							try
							{
							ResultSet rs3=null;
							
							db.connect();
							rs3=db.execSQL("select p.id,p.no,s.POLICE_STATION,s.ID from SAKANSHA.PETTY as p,SAKANSHA.POLICE_DUTY as s where p.POLICESTATION=s.POLICE_STATION and s.id='"+session.getAttribute("id")+"'order by on desc fetch first 3 rows only ");
							while(rs3.next())
							{
							//to fetch recent fir cases
							%>
							<tr>
								<td><a href='vpetty.jsp?id=<%=rs3.getString("id") %>'><%=rs3.getString("no") %></a></td>
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
							<%
									}
							
							}
							catch(Exception e)
							{
							out.println("Error"+e.getMessage());
							}
							 %>							
						</table><br /><br /><h1>View All Cases</h1>
 <table  width='73%'><tr><td colspan='4'><strong>Case Files</strong></td></tr><tr><td align='center' style='valign:top'><input type="button" value="FIR Cases" onclick="seeallfir(1)"/></td><td align='center'><input type="button"  onclick="seeallfir(2)" value="Petty Cases" /></td><td align='center'></td><td></td></tr><tr><td colspan='4'><hr /></td></tr></table>
       



<jsp:include page='foot.jsp' flush="false"></jsp:include>
</body>
</html>