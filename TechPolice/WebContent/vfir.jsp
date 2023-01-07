<DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/dropdown-menu.css" rel="stylesheet" type="text/css" />
<jsp:useBean id="db" class="database.dncon" />
<script type="text/javascript" src="techfiles/ajax.js"></script>
<script type="text/javascript" src="techfiles/othervalids.js"></script>
<script type="text/javascript" src="techfiles/valids.js"></script>
<title>FIR Cases| LAW &amp; ORDER</title>
</head>

<body>
<%if(session.getAttribute("login")==null)
  { %>
 <jsp:forward	page="in.jsp"><jsp:param name="err" value="You must login first or sign up to use our services." /></jsp:forward>
   <%} %>
<%  try{
						db.connect();
						ResultSet rs2=null;
						rs2=db.execSQL("select i.NAME,k.IMAGE,k.ID,i.SUBJECT_ID from SAKANSHA.SUBJECT as i,SAKANSHA.SIGNIN as k  where k.ID="+session.getAttribute("id")+" and i.SUBJECT_ID="+session.getAttribute("id"));
						
						while(rs2.next())
						{
						%>
<div id="container">
		<div id="header">
        	<h1><img src="images/sc.png" width="50" height="52"></h1>
            <h2><font color=black><b>Welcome Officer</b></font>,<font color=green> <%=rs2.getString("NAME") %></font></h2>
        </div>   
        
       <ul id="navigation" class="nav-main">
	<li><a href="index.jsp">Home</a></li>
    
    <li class="list"><a href="#">Diaries</a>
	<ul class="nav-sub">
    <li><a href="hotel.jsp">PS Diary</a></li>
		<li><a href="gunlicense.jsp">Station HO Diary</a></li>
		<li><a href="loudspeakers.jsp">Lock Up Diary</a></li>
		<li><a href="massmeeting.jsp">License Diary</a></li>
		
	</ul>
	</li>
    
    <li class="list"><a href="#">Criminal</a>
	<ul class="nav-sub">
    <li><a href="messagefromdgp.jsp">View/Find Criminal</a></li>
 		<li><a href="policehistory.jsp">Add Criminal</a></li>
		<li><a href="policeorganisation.jsp">Remove Criminal</a></li>
		<li><a href="policewelfare.jsp">Update Criminal</a></li>
	</ul>
	</li>
    
    <li><a href="userservices.jsp">Forward Information</a></li>
    <li><a href="lawsandacts.jsp">Mail</a></li>
    <li><a href="protecturself.jsp">Forums</a></li>
    <li><a href="usercontact.jsp">Generate Reports</a></li>
    <li><a href="gallery.jsp"><b>Know Your Duties</b> </a></li>
    <li><a href="logoutuser.jsp"><font color=red>Logout</font></a></li>

</ul>

        
        <div id="leftmenu">

        <div id="leftmenu_top"></div>

				<div id="leftmenu_main">    
               
                <h3>Officer, <%=rs2.getString("name") %></h3>
                     <img src="upload/<%=rs2.getString("IMAGE") %>" align="middle" width="200" height="167" />  <%}}catch (Exception e){out.print(e);} %><br/>
               <%
					db.connect();
					String query="select p.name as station,i.fir as firno,a.FIR ,a.ID,o.name,i.on from SAKANSHA.FIR_DETAILS as i,SAKANSHA.POLICE_DUTY as o,SAKANSHA.POLICESATION as p,SAKANSHA.CASES as a where i.id=a.FIR and a.id='"+request.getParameter("id")+"' and o.id=i.by and p.ps_id=i.POLICESTATION";
					ResultSet rs=db.execSQL(query);
					while(rs.next())
					{
						%>
               
                <ul>
                    <li><a href=#><font color=orange><i>FIR/Petty Case Menu</i></font></a></li>
                    <li><a href='policefir.jsp?id=<%=request.getParameter("id")%>'>View FIR</a></li>
                    <li><a href='crimedetails.jsp?id=<%=request.getParameter("id")%>'>Crime Details</a></li>
                     <li><a href='fform.jsp?id=<%=request.getParameter("id")%>'>Final Form</a></li>
                    <li><a href='surrender.jsp?id=<%=request.getParameter("id")%>'>Arrest/Surrender Form</a></li>
                    <li><a href='propsue.jsp?id=<%=request.getParameter("id")%>'>Property Seizur</a></li>
                     <li><a href='det.jsp?id=<%=request.getParameter("id")%>'>Case Detectives</a></li>
                      <li><a href='att.jsp?id=<%=request.getParameter("id")%>'>Attach Files</a></li>
                      
                </ul>
</div>
                
                          
                
              <div id="leftmenu_bottom"></div>
        </div>
        
      
        
		<div id="content">
        
        
        <div id="content_top"></div>
        <div id="content_main">
        <table style="text-align: left" align="center">
						
						<tr><td colspan="2"><h1><font color=teal>Case Details of <%=rs.getString("firno") %></font></h1><br /></td></tr>
						<tr>
							<td><b>FIR Number :</b></td>
							<td><i><%=rs.getString("firno") %></i></td>
						</tr>
								<tr>
							<td><b>FIR Filed By :</b></td>
							<td><i><%=rs.getString("name") %></i></td>
						</tr>
								<tr>
							<td><b>FIR Filed On :</b></td>
							<td><i><%=rs.getString("on") %></i></td>
						</tr>
						<tr>
							<td><b>Police Station :</b></td>
							<td><i><%=rs.getString("station") %></i></td>
						</tr>
						<%
					}
					db.close();
					 %>
					
					</table>
					<br /><br />
					<center></center>
					
        
<jsp:include page='foot.jsp' flush="false"></jsp:include>
</body>
</html>