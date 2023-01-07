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

      <%
try
{
db.connect();
out.print("out");
ResultSet rs=db.execSQL("select CRIMEDETAIL from SAKANSHA.CASES where id="+request.getParameter("id"));
while(rs.next())
{out.print("out");
	String a=rs.getString("CRIMEDETAIL");

	if(Integer.parseInt(a)==0)
	{
				
					String name=request.getParameter("name");
					String sdhname=request.getParameter("sdhname");
					String add=request.getParameter("add");
					String crimetype=request.getParameter("crimetype");
					String major=request.getParameter("major");
					String minor=request.getParameter("minor");
					String conve=request.getParameter("conve");
					String propertytype=request.getParameter("propertytype");
					String detail=request.getParameter("detail");
					
					
					String date=request.getParameter("date");
					String month=request.getParameter("month");
					String year=request.getParameter("year");
					String occ=request.getParameter("time_occurance");
					String place=request.getParameter("place_occur");
					String wit_name=request.getParameter("wit_name");
					
					String laws=request.getParameter("laws");
					
					
					
					String[] monthName = {"zero","January", "February",
					            "March", "April", "May", "June", "July",
					            "August", "September", "October", "November",
					            "December"};
					 
					        
					String monthname = monthName[Integer.parseInt(month)];
					   
					String crime="<crime>"
					+"<name>"+name+"</name>"
					+"<sdhname>"+sdhname+"</sdhname>"
					+"<address>"+add+"</address>"
					+"<crimetype>"+crimetype+"</crimetype>"
					+"<major>"+major+"</major>"
					+"<minor>"+minor+"</minor>"
					+"<conve>"+conve+"</conve>"
					+"<propertytype>"+propertytype+"</propertytype>"
					+"<detail>"+detail+"</detail>"
					+"<date>"+monthname+"/"+date+"/"+year+"</date>"
					+"<occurence>"+occ+"</occurence>"
					+"<place>"+place+"</place>"
					+"<witness>"+wit_name+"</witness>"
					+"</crime>";
					
					
					String query="insert into SAKANSHA.CRIME(ID,POLICESTATION,TIME,ACT,CRIMEDETAILS) values((select max(id)+1 from SAKANSHA.CRIME),(select POLICESTATION from SAKANSHA.POLICEJOB where P_IP="+session.getAttribute("id")+"),current_timestamp,'"+laws+"','"+crime+"')";
					db.updateSQL(query);
					String query1="update SAKANSHA.CASES set CRIMEDETAIL=(select max(id) from SAKANSHA.CRIME) where id="+request.getParameter("id");
					db.updateSQL(query1);
					%> <jsp:forward	page="suc.jsp"><jsp:param name="err1" value="Details were aadded successfully." /></jsp:forward> <%
	}
	else
	{
					String name=request.getParameter("name");
					String sdhname=request.getParameter("sdhname");
					String add=request.getParameter("add");
					String crimetype=request.getParameter("crimetype");
					String major=request.getParameter("major");
					String minor=request.getParameter("minor");
					String conve=request.getParameter("conve");
					String propertytype=request.getParameter("propertytype");
					String detail=request.getParameter("detail");
					
					
					String fulldate=request.getParameter("fulldate");
					
						String occ=request.getParameter("time_occurance");
					String place=request.getParameter("place_occur");
					String wit_name=request.getParameter("wit_name");
					
					
					
					String crime="<crime>"
					+"<name>"+name+"</name>"
					+"<sdhname>"+sdhname+"</sdhname>"
					+"<address>"+add+"</address>"
					+"<crimetype>"+crimetype+"</crimetype>"
					+"<major>"+major+"</major>"
					+"<minor>"+minor+"</minor>"
					+"<conve>"+conve+"</conve>"
					+"<propertytype>"+propertytype+"</propertytype>"
					+"<detail>"+detail+"</detail>"
					+"<date>"+fulldate+"</date>"
					+"<occurence>"+occ+"</occurence>"
					+"<place>"+place+"</place>"
					+"<witness>"+wit_name+"</witness>"
					+"</crime>";
					
					String query2="update SAKANSHA.CRIME set CRIMEDETAILS='"+crime+"' where id="+rs.getString("CRIMEDETAIL");
					db.updateSQL(query2);
					%> <jsp:forward	page="suc.jsp"><jsp:param name="err1" value="Crime Details were aadded successfully." /></jsp:forward> <%
	}
				
		
}
	db.close();
}
catch(Exception e)
{
out.print("Error"+e.getMessage());

}

%>


<jsp:include page='foot.jsp' flush="false"></jsp:include>
</body>
</html>