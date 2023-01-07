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
<title>FIR/Petty Cases| LAW &amp; ORDER</title>
</head>

<body>
<jsp:include page='head.jsp' flush="false"></jsp:include>
      
        
    
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        
        <%
try
{
db.connect();
ResultSet rs=db.execSQL("select property from sakansha.cases where id="+request.getParameter("id"));
while(rs.next())
{
	String a=rs.getString("property");

	if(Integer.parseInt(a)==0)
	{
					String laws=request.getParameter("laws");
					
					String propertytype=request.getParameter("propertytype");
					String date=request.getParameter("date");
					String month=request.getParameter("month");
					String year=request.getParameter("year");
					String time=request.getParameter("time");
					String place=request.getParameter("place");
					String placedes=request.getParameter("place_property_seized");
					String name=request.getParameter("name");
					String sdhname=request.getParameter("sdhname");
					String occupation=request.getParameter("occupation");
					String person_addre=request.getParameter("person_addre");
					String w_name=request.getParameter("w_name");
					String w_sdhname=request.getParameter("w_sdhname");
					String occupation1=request.getParameter("occupation1");
					String witness_detail=request.getParameter("witness_detail");
					String witness_addre=request.getParameter("witness_addre");
					
					String[] monthName = {"zero","January", "February",
					            "March", "April", "May", "June", "July",
					            "August", "September", "October", "November",
					            "December"};
					 
					        
					String monthname = monthName[Integer.parseInt(month)];
					   
					String property="<property>"
					+"<propertytype>"+propertytype+"</propertytype>"
					+"<date>"+monthname+"/"+date+"/"+year+"</date>"
					+"<time>"+time+"</time>"
					+"<place>"+place+"</place>"
					+"<placedes>"+placedes+"</placedes>"
					+"<name>"+name+"</name>"
					+"<sdhname>"+sdhname+"</sdhname>"
					+"<occupation>"+occupation+"</occupation>"
					+"<person_addre>"+person_addre+"</person_addre>"
					+"<w_name>"+w_name+"</w_name>"
					+"<w_sdhname>"+w_sdhname+"</w_sdhname>"
					+"<occupation1>"+occupation1+"</occupation1>"
					+"<witness_detail>"+witness_detail+"</witness_detail>"
					+"<witness_addre>"+witness_addre+"</witness_addre>"

					+"</property>";
					
					
					String query="insert into sakansha.propertydetails(id,policestation,time,act,proprty) values((select max(id)+1 from sakansha.propertydetails),(select police_station from sakansha.police_duty where id="+session.getAttribute("id")+"),current_timestamp,'"+laws+"','"+property+"')";
					db.updateSQL(query);
					String query1="update sakansha.cases set property=(select max(id) from sakansha.propertydetails) where id="+request.getParameter("id");
					db.updateSQL(query1);
					%> <jsp:forward	page="suc.jsp"><jsp:param name="err1" value="Success.Property Details were aadded." /></jsp:forward> <%
	}
	else
	{
					String laws=request.getParameter("laws");
					
					String propertytype=request.getParameter("propertytype");
					String fulldate=request.getParameter("fulldate");
					
					String time=request.getParameter("time");
					String place=request.getParameter("place");
					String placedes=request.getParameter("place_property_seized");
					String name=request.getParameter("name");
					String sdhname=request.getParameter("sdhname");
					String occupation=request.getParameter("occupation");
					String person_addre=request.getParameter("person_addre");
					String w_name=request.getParameter("w_name");
					String w_sdhname=request.getParameter("w_sdhname");
					String occupation1=request.getParameter("occupation1");
					String witness_detail=request.getParameter("witness_detail");
					String witness_addre=request.getParameter("witness_addre");
					
				
					   
					String property="<property>"
					+"<propertytype>"+propertytype+"</propertytype>"
					+"<date>"+fulldate+"</date>"
					+"<time>"+time+"</time>"
					+"<place>"+place+"</place>"
					+"<placedes>"+placedes+"</placedes>"
					+"<name>"+name+"</name>"
					+"<sdhname>"+sdhname+"</sdhname>"
					+"<occupation>"+occupation+"</occupation>"
					+"<person_addre>"+person_addre+"</person_addre>"
					+"<w_name>"+w_name+"</w_name>"
					+"<w_sdhname>"+w_sdhname+"</w_sdhname>"
					+"<occupation1>"+occupation1+"</occupation1>"
					+"<witness_detail>"+witness_detail+"</witness_detail>"
					+"<witness_addre>"+witness_addre+"</witness_addre>"
					+"</property>";
					
					String query2="update sakansha.propertydetails set proprty='"+property+"',act='"+laws+"' whereid="+rs.getString("property");
					db.updateSQL(query2);
					%> <jsp:forward	page="suc.jsp"><jsp:param name="err1" value="Success.Property Details were aadded." /></jsp:forward> <%
	}
				
		
}
	db.close();
}
catch(Exception e)
{
out.print("Error"+e.getMessage());

}

%>
        

</body>
</html>