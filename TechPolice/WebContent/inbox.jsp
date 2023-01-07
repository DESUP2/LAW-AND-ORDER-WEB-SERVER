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
<style>
        .black_overlay{
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index:1001;
            -moz-opacity: 0.8;
            opacity:.80;
            filter: alpha(opacity=80);
        }
        .white_content {
            display: none;
            position: absolute;
            top: 25%;
            left: 25%;
            width: 50%;
            height: 50%;
            padding: 16px;
            border: 16px solid orange;
            background-color: white;
            z-index:1002;
            overflow: auto;
        }
    </style>
</head>
<body>
<jsp:include page='head.jsp' flush="false"></jsp:include>
      
        
    
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        <script type="text/javascript" src="techfiles/dom.js"></script>
       
	<center><h2><font color=green> INBOX</font></h2></center>
<table border="0">
	<tbody>
		<tr bgcolor=teal>
			<th width="149">From</th>
			<th width="244">Subject</th>
			<th width="112">Time</th>
			<th width="189">Date</th>
			<th width="192">FromID</th>
		</tr>
	




<% 
						db.connect();
						ResultSet rs2=null;
						rs2=db.execSQL("select i.TOID,i.SUBJECT,i.MESSAGE,i.FROM,i.DATE,i.TIME,i.FROMNAME from SAKANSHA.MAIL as i where i.TOID="+session.getAttribute("id"));
						while(rs2.next())
						{%>
		
						

<tr>
	<td ><b><%=rs2.getString("FROMNAME")%></b></td>
	<td width="244"><a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'"><%=rs2.getString("SUBJECT")%></a><div id="light" class="white_content1"><b><i>Subject :</i></b><%=rs2.getString("SUBJECT")%> <br /><b><i>Message :</i></b><%=rs2.getString("MESSAGE")%><br /><br /><br /><a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"><font color=red>CLOSE</font></a></div></td>
	<td width="112"><%=rs2.getString("TIME")%></td>
	<td width="189"><%=rs2.getString("DATE")%></td>
	<td width="192"><%=rs2.getString("FROM")%></td>


<%} %>
				
	</tr></tbody>
</table>		

<jsp:include page='foot.jsp' flush="false"></jsp:include>
        

</body>
</html>