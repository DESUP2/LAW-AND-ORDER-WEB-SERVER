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
        <%
			db.connect();
			ResultSet rs1=null;
			rs1=db.execSQL("select c.ID,i.fir,t.date,t.occurence,t.date1,t.timereport,t.place,t.parti,t.totalvalue,t.name,t.sdhname,t.nationality,t.first,t.second,t.occupation,t.summary from SAKANSHA.FIR_DETAILS as i,SAKANSHA.CASES as c,xmltable('$c/fir' passing i.details as \"c\" columns date varchar(15) path 'date',occurence varchar(6) path 'occurance',date1 varchar(15) path 'date1',timereport varchar(6) path 'timereport',place varchar(1000) path 'place',parti varchar(1000) path 'parti',totalvalue varchar(20) path 'totalvalue',name varchar(50) path 'name',sdhname varchar(50) path 'sdhname',nationality varchar(20) path 'nationality',first varchar(50) path 'first',second varchar(50) path 'second',occupation varchar(50) path 'occupation',summary varchar(1000) path 'summary') as t where i.id=c.ID and c.id="+request.getParameter("id")+"");
			
			while(rs1.next())
			{
			 %>
			 <table width="100%" background="images/s1.png" align="center">
			 	<tr>
			 		<td><b>FIR Number</b></td>
			 		<td><%=rs1.getString("fir") %></td>
			 	</tr>
			 	<tr>
			 		<td>Date and Time of Crime Occurred</td>
			 		<td><%=rs1.getString("date") %> <%=rs1.getString("occurence") %></td>
			 	</tr>
			 	<tr>
			 		<td>Date and Time of Crime Reported</td>
			 		<td><%=rs1.getString("date1") %> <%=rs1.getString("timereport") %></td>
			 	</tr>
			 	<tr>
			 		<td>Place of Crime</td>
			 		<td><%=rs1.getString("place") %> </td>
			 	</tr>
			 	<tr>
			 		<td>Particulars of Crime / Stolen Property</td>
			 		<td><%=rs1.getString("parti") %> </td>
			 	</tr>
			 	<tr>
			 		<td>Total Value</td>
			 		<td><%=rs1.getString("totalvalue") %> </td>
			 	</tr>
			 	<tr>
			 		<td colspan='2'><strong>Complainant Details</strong></td>
			 	</tr>
			 	<tr>
			 		<td>Name of the complainant</td>
			 		<td><%=rs1.getString("name") %> </td>
			 	</tr>
			 	<tr>
			 		<td>Son/Daughther/Father name</td>
			 		<td><%=rs1.getString("sdhname") %> </td>
			 	</tr>
			 	<tr>
			 		<td>Occupation</td>
			 		<td><%=rs1.getString("occupation") %> </td>
			 	</tr>
			 	<tr>
			 		<td>Nationality</td>
			 		<td><%=rs1.getString("nationality") %> </td>
			 	</tr>
			 	<tr>
			 		<td colspan='2'><strong>Suspect name</strong></td>
			 	</tr>
				<tr>
			 		<td>First Suspect Name <br/>(Can be blank,seperatly added)</td>
			 		<td><%=rs1.getString("first") %></td>
			 	</tr>
			 	<tr>
			 		<td>Second Suspect Name</td>
			 		<td><%=rs1.getString("second") %> </td>
			 	</tr>
			 		<tr>
			 		<td>FIR Summary</td>
			 		<td><%=rs1.getString("summary") %> </td>
			 	</tr>
			 	<tr><td colspan="2"><a style="cursor: pointer" onclick="javascript:history.back()"><h6>Back</h6></a></td></tr>
			 </table>
			 <%
			 }
			 db.close();
			 %>
<jsp:include page='foot.jsp' flush="false"></jsp:include>
</body>
</html>