<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page language="java" import="java.sql.*" %>
<%@page language="java" import="java.util.Date" %>
<jsp:useBean id="db" class="database.dncon" />
 <%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
  <%@page import="java.util.Date" %>
  <%@page language="java" import="java.io.*, javax.swing.*, java.awt.*,
java.sql.*, java.util.*, net.sf.jasperreports.engine.*,
net.sf.jasperreports.view.*;" %>
<html>
<head>
<title>Most Wanted Criminals |Law &amp; Order Automation</title>
</head>
<body>
<jsp:include page='head.jsp' flush="false"></jsp:include>
      
        
    
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        
        <% 
 String to =request.getParameter("to");
 String sub=request.getParameter("subject");
  String msg=request.getParameter("msg");
  String from=request.getParameter("from");
    String name=request.getParameter("name");
  		db.connect();				
						try{
						
						ResultSet rs6=null;
						
						
						rs6=db.execSQL("select i.ID as first,i.USERNAME as second from SAKANSHA.SIGNIN as i where i.USERNAME='"+to+"'")  ;
						if(rs6.next())
						{
										
	try
	{
	db.connect();
	ResultSet rs2=null;
	String query="INSERT INTO SAKANSHA.MAIL (ID,TOID,FROMID,DATE,TIME,SUBJECT,MESSAGE,FROM,TO,FROMNAME)   VALUES ( (select max(ID)+1 from SAKANSHA.MAIL),"+rs6.getString("first")+", '"+session.getAttribute("id")+"', current_date, current_time, '"+sub+"','"+msg+"','"+from+"', '"+to+"','"+name+"')";
		db.updateSQL(query);
	
						%>
						
						<jsp:forward	page="suc.jsp"><jsp:param name="err1" value="Your Mail was successfully sent." /></jsp:forward>
						
						<%} catch (Exception e) {out.print(e);} %>
						
						
						<% } else {%><jsp:forward	page="compose.jsp"><jsp:param name="err" value="You entered invalid email id." /></jsp:forward><%} %>
						<%db.close();}
						catch(Exception e)
						{
						out.print(e);}
						 %>
						 
</body>
</html>