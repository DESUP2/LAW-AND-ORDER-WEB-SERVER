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
       
        
        <table width='100%'>
				<tr>
					
					<td width="100%" valign="top">
					
						<table width="100%" cellpadding="6"  cellspacing="6">
							<tr>
								<td></td>
							</tr>
							<tr>
								<td  style="font-size:18px" colspan="2"><h1>Criminal I/O Diary</h1></td>
							</tr>
							<tr>
								<td>Name</td>
								<td><input type="text" name="name1"  maxlength="35"/></td>
							</tr>
							<tr>
								<td>Jail No</td>
								<td><input type="text" name="alias"  maxlength="50"/></td>
							</tr>									
							<tr>
								<td>In Date</td>
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
		</td>							</tr>				
					
							<tr>
								<td>Out Date</td>
											
		<td><select name='year' onchange='listdate(document.RegistrationForm.month.value,this.value)'>
				<option value='0'>year</option>
			<%
			Date date1=new Date();


			SimpleDateFormat simpleDateformat1=new SimpleDateFormat("yyyy");
			int a1=Integer.parseInt(simpleDateformat.format(date));
			for(int i=a;i>=1947;--i)
			{
			%>
			<option value='<%=i %>'><%=i %></option>
			<%
			}
			
			 %>		
			</select> 
			<select name='month1' onchange='listdate(this.value,document.RegistrationForm.year.value)'>
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
			</select><span id='dateselDIV1'>
					<select name='date1'>
					<option>dd</option>
					</select> </span>
		</td>
		
		</tr>
							<tr>
								<td>Reason:</td>
								<td><input type="text"  name="height" maxlength="35"/></td>
							</tr>
							<tr>
								<td>Court:</td>
								<td><input type="text"  name="weight" maxlength="35"/></td>
							</tr>
							<tr>
								<td>FIR:</td>
								<td>
								<input type="text" name="color"  />
								</td>
							</tr>
							<tr>
								<td>Case :</td>
								<td>
							<input type="text" name="haircolor"  />
								</td>
							</tr>
							<tr>
								<td>Left Image :</td>
								<td><input type="file" name="file1" /></td>
							</tr>
							<tr>
								<td>Right Image :</td>
								<td><input type="file" name="file2" /></td>
							</tr>
							<tr>
								<td>Front Image</td>
								<td><input type="file" name="file3" /></td>
							</tr>
							<tr>
								<td>Finger Print</td>
								<td><input type="file" name="file4" /></td>
							</tr>
							<tr>
								<td>Is he a most wanted criminal :</td>
								<td>
									<select name='most'>
										<option value='0'>Select</option>
										<option value='1'>Yes</option>
										<option value='2'>No</option>
									</select>
								</td>
							</tr>							
						</table>
						
					</td>
				</tr>
					
				<tr>
				<td colspan="2">
				<table width='100%' cellspacing='5' cellpadding='5'  style='text-align:center;vertical-align: top;background:#f3f3f3;width:100%'>
	<tr>
		<td width='25%'>&nbsp;</td>
		<td><a href="suc.jsp?err1=Diary Updated"/><input id='submit' type='submit' value='Update'/></a><input type="hidden" value="<%=request.getParameter("id") %>" name="id"/></td>
		<td><input type='reset' value='Reset'/></td>
		<td width='25%'>&nbsp;</td>
		
	</tr>
	
	</table></td></tr></table>
	<jsp:include page='foot.jsp' flush="false"></jsp:include>
        

</body>
</html>