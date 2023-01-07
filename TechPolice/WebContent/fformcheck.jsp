<DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/dropdown-menu.css" rel="stylesheet" type="text/css" />
<jsp:useBean id="db" class="database.dncon" />
 <%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
  <%@page import="java.util.Date" %> <%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
  <%@page import="java.util.Date" %>
  
<script type="text/javascript" src="techfiles/ajax.js"></script>
<script type="text/javascript" src="techfiles/othervalids.js"></script>
<script type="text/javascript" src="techfiles/valids.js"></script>
<title>FIR/Petty Cases| LAW &amp; ORDER</title>
</head>

<body>
<jsp:include page='head.jsp' flush="false"></jsp:include>
<div id="content">
        
        
        <div id="content_top"></div>
        <div id="content_main">
        
        <%
try
{
db.connect();
ResultSet rs=db.execSQL("select final from SAKANSHA.CASES where id="+request.getParameter("id"));
while(rs.next())
{
	String a=rs.getString("final");

	if(Integer.parseInt(a)==0)
	{
				
					String court=request.getParameter("court");
					String date=request.getParameter("date");
					String month=request.getParameter("month");
					String year=request.getParameter("year");
					String laws=request.getParameter("laws");
					String type_fr[]=request.getParameterValues("type_fr");
					String b="";
					String c="";
					String type_fr1[]=request.getParameterValues("type_fr1");	
	if (type_fr != null) 
   {
      for (int i = 0; i < type_fr.length; i++) 
      {
      		b+=type_fr[i]+"<br/>";
			
      }
   
   }
   	if (type_fr1 != null) 
   {
      for (int i = 0; i < type_fr1.length; i++) 
      {
      		c+=type_fr1[i]+"<br/>";
			
      }
     
   }
		String[] monthName = {"zero","January", "February",
					            "March", "April", "May", "June", "July",
					            "August", "September", "October", "November",
					            "December"};
					 
					        
										
		 			String complai_name=request.getParameter("complai_name");
					String father_name=request.getParameter("father_name");
					String accu_name=request.getParameter("accu_name");
					String accu_father_name=request.getParameter("accu_father_name");
					
					String month1=request.getParameter("month1");
					String year1=request.getParameter("year1");
					String date1=request.getParameter("date1");
					
					String occupation=request.getParameter("occupation");
					String add=request.getParameter("add");
					String bailer=request.getParameter("bailer");
					
					
					
					String result_library=request.getParameter("result_library");
					String brieffacts=request.getParameter("brieffacts");
					
					//String despatchon=request.getParameter("despatchon");
					
					String month2=request.getParameter("month2");
					String year2=request.getParameter("year2");
					String date2=request.getParameter("date2");
					
					        
			String monthname = monthName[Integer.parseInt(month)];
					
 
					        
					String monthname1 = monthName[Integer.parseInt(month1)];
        
					String monthname2 = monthName[Integer.parseInt(month2)];
			
					String all="<final>"
					+"<court>"+court+"</court>"
					+"<date>"+monthname+"/"+date+"/"+year+"</date>"
					+"<laws>"+laws+"</laws>"
					+"<type_fr>"+b+"</type_fr>"
					+"<type_fr1>"+c+"</type_fr1>"
					+"<complai_name>"+complai_name+"</complai_name>"
					+"<father_name>"+father_name+"</father_name>"
					+"<accu_name>"+accu_name+"</accu_name>"
					+"<accu_father_name>"+accu_father_name+"</accu_father_name>"
					+"<date1>"+monthname1+"/"+date1+"/"+year1+"</date1>"
					+"<occupation>"+occupation+"</occupation>"
					+"<add>"+add+"</add>"
					+"<bailer>"+bailer+"</bailer>"
					+"<result_library>"+result_library+"</result_library>"
					+"<brieffacts>"+brieffacts+"</brieffacts>"
					
					+"<date2>"+monthname2+"/"+date2+"/"+year2+"</date2>"
					+"</final>";
					
					
					String query="insert into SAKANSHA.MAINREPORT(ID,POLICESTATION,TIME,ACT,REPORT) values((select max(id)+1 from SAKANSHA.MAINREPORT),(select POLICE_STATION from SAKANSHA.POLICE_DUTY where id="+session.getAttribute("id")+"),current_time,'"+laws+"','"+all+"')";
					db.updateSQL(query);
					String query1="update SAKANSHA.CASES set final=(select max(id) from SAKANSHA.MAINREPORT) where id="+request.getParameter("id");
					db.updateSQL(query1);
					%> <jsp:forward	page="suc.jsp"><jsp:param name="err1" value="Main Report Details were aadded successfully." /></jsp:forward>  <%
	}
	else
	{
					String court=request.getParameter("court");
				
					String fullyear=request.getParameter("fullyear");
					String fullyear1=request.getParameter("fullyear1");
					String fullyear2=request.getParameter("fullyear2");
					
					String laws=request.getParameter("laws");
					String type_fr=request.getParameter("type_fr");
					String type_fr1=request.getParameter("type_fr1");	
	
					
		 
		 			String complai_name=request.getParameter("complai_name");
					String father_name=request.getParameter("father_name");
					String accu_name=request.getParameter("accu_name");
					String accu_father_name=request.getParameter("accu_father_name");
					
					
					String occupation=request.getParameter("occupation");
					String add=request.getParameter("add");
					String bailer=request.getParameter("bailer");
					
					
					
					String result_library=request.getParameter("result_library");
					String brieffacts=request.getParameter("brieffacts");
				
					
					
					
					String all="<final>"
					+"<court>"+court+"</court>"
					+"<date>"+fullyear+"</date>"
					+"<laws>"+laws+"</laws>"
					+"<type_fr>"+type_fr+"</type_fr>"
					+"<type_fr1>"+type_fr1+"</type_fr1>"
					+"<complai_name>"+complai_name+"</complai_name>"
					+"<father_name>"+father_name+"</father_name>"
					+"<accu_name>"+accu_name+"</accu_name>"
					+"<accu_father_name>"+accu_father_name+"</accu_father_name>"
					+"<date1>"+fullyear1+"</date1>"
					+"<occupation>"+occupation+"</occupation>"
					+"<add>"+add+"</add>"
					+"<bailer>"+bailer+"</bailer>"
					+"<result_library>"+result_library+"</result_library>"
					+"<brieffacts>"+brieffacts+"</brieffacts>"
					+"<date2>"+fullyear2+"</date2>"
					+"</final>";
					
					String query2="update SAKANSHA.MAINREPORT set REPORT='"+all+"' where id="+rs.getString("final");
					db.updateSQL(query2);
					%><jsp:forward	page="suc.jsp"><jsp:param name="err1" value="Main Report Details were aadded successfully." /></jsp:forward> <%
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