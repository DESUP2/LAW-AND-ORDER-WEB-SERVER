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


<%
try
{
db.connect();
ResultSet rs=db.execSQL("select  detective from sakansha.cases where id="+request.getParameter("id"));
while(rs.next())
{
	String a=rs.getString("detective");

	if(Integer.parseInt(a)==0)
	{
				
					String pass=request.getParameter("pass");
					
					
					String detail1=request.getParameter("detail1");
					String detail2=request.getParameter("detail2");
					String detail3=request.getParameter("detail3");
					String detail4=request.getParameter("detail4");
					
					
					
					 
					        
				
					String det="<det>"
					+"<detail1>"+detail1+"</detail1>"
					+"<detail2>"+detail2+"</detail2>"
					+"<detail3>"+detail3+"</detail3>"
					+"<detail4>"+detail4+"</detail4>"
					+"</det>";
					
					
					String query="insert  into sakansha.detective_detail(id,policestation,time,detective_detail) values((select count(id)+1 from sakansha.detective_detail),(select policestation from sakansha.policejob where p_ip="+session.getAttribute("id")+"),current_timestamp,'"+det+"')";
					db.updateSQL(query);
					String query1="update sakansha.cases set password='"+pass+"',detective=(select max(id) from sakansha.detective_detail) where id="+request.getParameter("id");
					db.updateSQL(query1);
					%><jsp:forward	page="suc.jsp"><jsp:param name="err1" value="Success.Detective Details were aadded." /></jsp:forward><%
	}
	else
	{
						String pass=request.getParameter("pass");
					
					
					String detail1=request.getParameter("detail1");
					String detail2=request.getParameter("detail2");
					String detail3=request.getParameter("detail3");
					String detail4=request.getParameter("detail4");
					
					
					
					 
					        
				
					String det="<det>"
					+"<detail1>"+detail1+"</detail1>"
					+"<detail2>"+detail2+"</detail2>"
					+"<detail3>"+detail3+"</detail3>"
					+"<detail4>"+detail4+"</detail4>"
					+"</det>";
					
					
					String query2="update sakansha.cases set password='"+pass+"' where id="+request.getParameter("id");
					db.updateSQL(query2);
					String query3="update sakansha.detective_detail set detective_detail='"+det+"' where id="+rs.getString("detective");
					db.updateSQL(query3);
					%> <jsp:forward	page="suc.jsp"><jsp:param name="err1" value="Success.Detective Details were aadded." /></jsp:forward><%
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