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
<script type="text/javascript" language="javascript">
function checkform()
	{	
			
			var msg = validateField(document.RegistrationForm.name1,'NAME','1','50','Name','\'"/\\@#^,&*~-$%!');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.name1.focus();
					return false;
				}
			var msg = validateField(document.RegistrationForm.alias,'NAME','1','50','Alias Name','\'"/\\@#^,&*~-$%!');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.alias.focus();
					return false;
				}
			var msg = validateField(document.RegistrationForm.sdhname,'NAME','1','50','Father Name','\'"/\\@#^,&*~-$%!');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.sdhname.focus();
					return false;
				}
			msg = validateField(document.RegistrationForm.birth,'STRING','5','70','Place of Birth','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.birth.focus();
					return false;
				}
				if(document.RegistrationForm.year.selectedIndex<1)
				{
					alert("Select Year of Birth");
					document.RegistrationForm.year.focus();
					return false;
				}
				if(document.RegistrationForm.month.selectedIndex<1)
				{
					alert("Select Month of Birth");
					document.RegistrationForm.month.focus();
					return false;
				}
				if(document.RegistrationForm.date.selectedIndex<1)
				{
					alert("Select Date of Birth");
					document.RegistrationForm.date.focus();
					return false;
				}
				msg=validateField(document.RegistrationForm.height,'INT','0','3','Height of Criminal','@#^,&*~-$%!');
				if(msg.length>0)
				{
					alert(msg);
					document.RegistrationForm.height.focus();
					return false;
				}
				msg=validateField(document.RegistrationForm.weight,'INT','0','3','Weight of Criminal','@#^,&*~-$%!');
				if(msg.length>0)
				{
					alert(msg);
					document.RegistrationForm.weight.focus();
					return false;
				}		
				if(document.RegistrationForm.color.selectedIndex<1)
				{
					alert("Select Skin Colour of Criminal");
					document.RegistrationForm.color.focus();
					return false;
				}
				if(document.RegistrationForm.haircolor.selectedIndex<1)
				{
					alert("Select Hair Colour of Criminal");
					document.RegistrationForm.haircolor.focus();
					return false;
				}
				msg = validateField(document.RegistrationForm.id,'STRING','5','200','Identification Mark\'s','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.id.focus();
					return false;
				}
				msg = validateField(document.RegistrationForm.last,'STRING','5','1000','Last seen place','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.last.focus();
					return false;
				}
			
				if(document.RegistrationForm.file.value.length == 0)			
				{
					alert("Please Upload Photograph of the criminal");	
					document.RegistrationForm.file.focus();
					return false;
				}
				if(document.RegistrationForm.most.selectedIndex<1)
				{
					alert("Select Is he/she Most wanted criminal or not");
					document.RegistrationForm.most.focus();
					return false;
				}
				
		return true;
	}	
</script>
</head>
<body>
<jsp:include page='head.jsp' flush="false"></jsp:include>
      
        
    
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        <script type="text/javascript" src="techfiles/dom.js"></script>
        <form name='RegistrationForm' action='addcriminalcheck.jsp' method="post" onsubmit="return checkform()" enctype="multipart/form-data">
        
        <table width='100%'>
				<tr>
					
					<td width="100%" valign="top">
						<table width="100%" cellpadding="6"  cellspacing="6">
							<tr>
								<td><a href='mostwanted.jsp'>Back to Criminal Home</a></td>
							</tr>
							<tr>
								<td  style="font-size:18px"><h1>Add Criminal Details</h1></td>
							</tr>
							<tr>
								<td>Name</td>
								<td><input type="text" name="name1" maxlength="35"/></td>
							</tr>
							<tr>
								<td>Alias Name's</td>
								<td><input type="text" name="alias" maxlength="50"/></td>
							</tr>									
							<tr>
								<td>Father's Name</td>
								<td><input type="text" name="sdhname" maxlength="35"/></td>
							</tr>				
							<tr>
								<td>Birth Place</td>
								<td><input type="text" name="birth" maxlength="35"/></td>
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
								<td><input type="text" name="height" maxlength="35"/></td>
							</tr>
							<tr>
								<td>Weight (in KG) :</td>
								<td><input type="text" name="weight" maxlength="35"/></td>
							</tr>
							<tr>
								<td>Color :</td>
								<td>
								<select name="color">
								<option value="0">Select</option>
								<option value="Black">Black</option>
								<option value="Brown">Brown</option>
								<option value="white">White</option>
								</select>
								</td>
							</tr>
							<tr>
								<td>Hair Color (in Cm) :</td>
								<td>
								<select name="haircolor">
								<option value="0">Select</option>
								<option value="Black">Black</option>
								<option value="Brown">Brown</option>
								<option value="white">White</option>
								</select>
								</td>
							</tr>
							<tr>
								<td>Identification Mark :</td>
								<td><input type="text" name="id" maxlength="35"/></td>
							</tr>
							<tr>
								<td>Last Seen At :</td>
								<td><textarea name="last"></textarea></td>
							</tr>
							<tr>
								<td>Photo</td>
								<td><input type="file" name="file" /></td>
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
		<td><input id='submit' type='submit' value='Submit'/></td>
		<td><input type='reset' value='Reset'/></td>
		<td width='25%'>&nbsp;</td>
		
	</tr>
	
	</table>
				</td>
				</tr>
			</table>
        
        
        <jsp:include page='foot.jsp' flush="false"></jsp:include>
</body>
</html>