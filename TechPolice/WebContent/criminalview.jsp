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
        <script type="text/javascript" src="techfiles/dom.js"></script>
        <form name='RegistrationForm' action='criminalviewcheck.jsp' method="post" enctype="multipart/form-data">
        <table width='100%'>
				<tr>
					
					<td width="100%" valign="top">
					<% 
							try
							{
							
							ResultSet rs=null;
							
							db.connect();
							rs=db.execSQL("select i.id,i.file,t.name1,t.last,t.height,t.weight,t.alias,t.birth,t.sdhname,t.color,t.haircolor from sakansha.criminal as i,xmltable('$c/criminal' passing i.details as \"c\" columns name1 varchar(100) path 'name1',last varchar(200) path 'last',height varchar(10) path 'height',weight varchar(15) path 'weight',alias varchar(100) path 'alias',birth varchar(100) path 'birth',sdhname varchar(50) path 'sdhname',color varchar(50) path 'color',haircolor varchar(50) path 'haircolor') as t where id="+request.getParameter("id")+"  order by on ");
							while(rs.next())
							{%>
						<table width="100%" cellpadding="6"  cellspacing="6">
							<tr>
								<td><a href='mostwanted.jsp' colspan="2">Back</a></td>
							</tr>
							<tr>
								<td  style="font-size:18px" colspan="2"><h1>Add Criminal Details</h1></td>
							</tr>
							<tr>
								<td>Name</td>
								<td><input type="text" name="name1" value="<%=rs.getString("name1") %>" maxlength="35"/></td>
							</tr>
							<tr>
								<td>Alias Name's</td>
								<td><input type="text" name="alias" value="<%=rs.getString("alias") %>" maxlength="50"/></td>
							</tr>									
							<tr>
								<td>Father's Name</td>
								<td><input type="text" name="sdhname" value="<%=rs.getString("sdhname") %>" maxlength="35"/></td>
							</tr>				
							<tr>
								<td>Birth Place</td>
								<td><input type="text" name="birth" maxlength="35" value="<%=rs.getString("birth") %>"/></td>
							</tr>
							<tr><td>Date:</td>
		<td><select name='year' onchange='listdate(document.RegistrationForm.month.value,this.value)'>
				<option value='0'>year</option>
			<%
			Date date=new Date();


			SimpleDateFormat simpleDateformat=new SimpleDateFormat("yyyy");
			int a=Integer.parseInt(simpleDateformat.format(date));
			for(int i=a;i>=1947;--i)
			{
			%>
			<option value='<%=i %>'><%=i %></option>
			<%
			}
			
			 %>		
			</select> 
			<select name='month' onchange='listdate(this.value,document.RegistrationForm.year.value)'>
				<option value='0'>mon</option>
				<option value='01'>jan</option>
				<option value='02'>feb</option>
				<option value='03'>mar</option>
				<option value='04'>apr</option>
				<option value='05'>may</option>
				<option value='06'>jun</option>
				<option value='07'>jul</option>
				<option value='08'>aug</option>
				<option value='09'>sep</option>
				<option value='10'>oct</option>
				<option value='11'>nov</option>
				<option value='12'>dec</option>
			</select><span id='dateselDIV'>
					<select name='date'>
					<option>dd</option>
					</select> </span>
		</td>
		
		</tr>
							<tr>
								<td>Height (in Cm) :</td>
								<td><input type="text" value="<%=rs.getString("height") %>" name="height" maxlength="35"/></td>
							</tr>
							<tr>
								<td>Weight (in KG) :</td>
								<td><input type="text" value="<%=rs.getString("weight") %>" name="weight" maxlength="35"/></td>
							</tr>
							<tr>
								<td>Color :</td>
								<td>
								<input type="text" name="color" value="<%=rs.getString("color") %>" />
								</td>
							</tr>
							<tr>
								<td>Hair Color (in Cm) :</td>
								<td>
							<input type="text" name="haircolor" value="<%=rs.getString("haircolor") %>" />
								</td>
							</tr>
							<tr>
								<td>Identification Mark :</td>
								<td><input type="text" name="id" value="<%=rs.getString("id") %>" maxlength="35"/></td>
							</tr>
							<tr>
								<td>Last Seen At :</td>
								<td><textarea name="last"><%=rs.getString("last") %></textarea></td>
							</tr>
							<tr>
								<td>Photo</td>
								<td><input type="file" name="file" /> <input type="hidden" value="<%=rs.getString("id") %>" name="idd"/></td>
							
							</tr>
							<tr>
								<td>Is he a most wanted criminal :</td>
								<td>
									<select name='most'>
										<option value='0'>Select</option>
										<option value='1'>Yes</option>
										<option value='2'>No</option>
										<option value='3'>Very Imp.</option>
									</select>
								</td>
							</tr>							
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
				<tr>
				<td colspan="2">
				<table width='100%' cellspacing='5' cellpadding='5'  style='text-align:center;vertical-align: top;background:#f3f3f3;width:100%'>
	<tr>
		<td width='25%'>&nbsp;</td>
		<td><input id='submit' type='submit' value='Update'/></td>
		<td><input type='reset' value='Reset'/></td>
		<td width='25%'>&nbsp;</td>
		
	</tr>
	
	</table>
	</td></tr></table>
	<jsp:include page='foot.jsp' flush="false"></jsp:include>

</body>
</html>