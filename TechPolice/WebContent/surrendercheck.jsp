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
ResultSet rs=db.execSQL("select crimedetail from sakansha.cases where id="+request.getParameter("id"));
while(rs.next())
{
	String a=rs.getString("crimedetail");

	if(Integer.parseInt(a)==0)
	{
					String laws=request.getParameter("laws");
					String court=request.getParameter("court");
					String portion=request.getParameter("applicable_portion");
					
					String name=request.getParameter("name");
					String sdhname=request.getParameter("sdhname");
					String alias=request.getParameter("alias");
					String nationality=request.getParameter("nationality");
					String voterid=request.getParameter("voterid");
					String fingerprint=request.getParameter("fingerprint");
					String witness_addre=request.getParameter("witness_addre");
					   
					String arrest="<arrest>"
					+"<action>"+portion+"</action>"
					+"<name>"+name+"</name>"
					+"<sdhname>"+sdhname+"</sdhname>"
					+"<alias>"+alias+"</alias>"
					+"<nationality>"+nationality+"</nationality>"
					+"<voterid>"+voterid+"</voterid>"
					+"<fingerprint>"+fingerprint+"</fingerprint>"
					+"<witness_addre>"+witness_addre+"</witness_addre>"
					+"</arrest>";
					
					
					String query="insert into sakansha.arrestdetails(id,policestation,time,act,court,arrestdetails,arrestedby) values((select max(id)+1 from sakansha.arrestdetails),(select police_station from police_duty where id="+session.getAttribute("id")+"),current_time,'"+laws+"','"+court+"','"+arrest+"',"+session.getAttribute("id")+")";
					db.updateSQL(query);
					String query1="update sakansha.cases set crimedetail=(select max(id) from sakansha.arrestdetails) where id="+request.getParameter("id");
					db.updateSQL(query1);
					%> <jsp:forward	page="suc.jsp"><jsp:param name="err1" value="Crime Details were aadded successfully." /></jsp:forward>  <%
	}
	else
	{
					String laws=request.getParameter("laws");
					String court=request.getParameter("court");
					String portion=request.getParameter("applicable_portion");
					
					String name=request.getParameter("name");
					String sdhname=request.getParameter("sdhname");
					String alias=request.getParameter("alias");
					String nationality=request.getParameter("nationality");
					String voterid=request.getParameter("voterid");
					String fingerprint=request.getParameter("fingerprint");
					String witness_addre=request.getParameter("witness_addre");
					
					
					
					
					
					
					   
					String arrest="<arrest>"
					+"<action>"+portion+"</action>"
					+"<name>"+name+"</name>"
					+"<sdhname>"+sdhname+"</sdhname>"
					+"<alias>"+alias+"</alias>"
					+"<nationality>"+nationality+"</nationality>"
					+"<voterid>"+voterid+"</voterid>"
					+"<fingerprint>"+fingerprint+"</fingerprint>"
					+"<witness_addre>"+witness_addre+"</witness_addre>"
					+"</arrest>";
					
					String query2="update sakansha.arrestdetails set court='"+court+"', act='"+laws+"', arrestdetails='"+arrest+"' where id="+rs.getString("crimedetail");
					db.updateSQL(query2);
					%> <jsp:forward	page="suc.jsp"><jsp:param name="err1" value="Success.Crime Details were added" /></jsp:forward>  <%
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