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
      
        <script  type="text/javascript" language="javascript" >
        function checkform()
{
		var msg = validateField(document.RegistrationForm.court,'STRING','5','200','Name of the court surrendered','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.court.focus();
					return false;
				}
		var msg1 = validateField(document.RegistrationForm.laws,'STRING','5','200','Actions & Sections','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.laws.focus();
					return false;
				}
		var msg2 = validateField(document.RegistrationForm.name,'NAME','1','50','Arrested Person\'s Name ','/\\@#^,&*~-$%!');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.name.focus();
					return false;
				}
		var msg3 = validateField(document.RegistrationForm.sdhname,'NAME','1','50','Arrested Person Father/Husband\'s Name','/\\@#^,&*~-$%!');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.sdhname.focus();
					return false;
				}
		var msg4 = validateField(document.RegistrationForm.alias,'NAME','1','50','Alias Name of Arrested Person','/\\@#^,&*~-$%!');
			if(msg.length > 0)			
			{
				alert(msg);	
				document.RegistrationForm.alias.focus();
				return false;
			}
		var msg5 = validateField(document.RegistrationForm.nationality,'NAME','1','50','Nationality of Arrested Person','/\\@#^,&*~-$%!');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.nationality.focus();
					return false;
				}
		var msg6 = validateField(document.RegistrationForm.voterid,'STRING','5','12','Voter ID of Arrested Person','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.voterid.focus();
					return false;
				}
		var msg7 = validateField(document.RegistrationForm.witness_addre,'STRING','5','500','Witness Name & Address','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.witness_addre.focus();
					return false;
				}
	return true;
}

</script>
    
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        <table align="center"><tr><td><h2><font color=teal>Arrest/Surrender Form</font></h2></td></tr></table>
        <form name="RegistrationForm" method="post" action="surrendercheck.jsp" onsubmit="return checkform()">
        <table width='100%'  style="width:100%;background:white"  style='text-align:left;vertical-align: top'>
			<tr>
					<td colspan="4" align='center'></td>
					
				</tr>
			
				
				<%
	try
	{
	db.connect();
	ResultSet rs=null;
	String query="select t.action,t.name,t.sdhname,t.alias,t.nationality,t.voterid,t.fingerprint,t.witness,i.act,i.court from SAKANSHA.ARRESTDETAILS as i, xmltable('$c/arrest' passing i.ARRESTDETAILS as \"c\" columns action varchar(100) path 'action',name varchar(100) path 'name',sdhname varchar(50) path 'sdhname',alias varchar(50) path 'alias',nationality varchar(50) path 'nationality',voterid varchar(50) path 'voterid',fingerprint varchar(100) path 'fingerprint',witness varchar(1000) path 'witness_addre') as t where i.id=(select arrestperson from sakansha.cases where id="+request.getParameter("id")+")";
	rs=db.execSQL(query);
	if(rs.next())
	{ %>
				<tr>
					<td >Name of the court(if surrendered): </td>
					<td><input type="text" name="court" maxlength="100" value="<%=rs.getString("court_name") %>" title='Please enter the court name'/></td>
					<td>Acts and Sections:<span class='style3'>*</span></td>
					<td><input type="text" name="laws" value="<%=rs.getString("act") %>"  />
					</td>				
				</tr>
				<tr>
					<td >Action Taken</td>
					<td>
					<textarea name="applicable_portion"><%=rs.getString("action") %></textarea>
					</td>
				</tr>
				<tr>
				<td colspan='4'><strong>Particulars of arrested person:</strong></td>
		</tr>
		<tr>
				<td style="width: 120px">Name: <span class='style3'>*</span></td>
		<td><input type="text" name="name" maxlength="50"	value="<%=rs.getString("name") %>"		title="Please enter the complainant's name"/></td>

		<td>Son/Daughter/Husband of :<span class='style3'>*</span></td>
		<td><input type="text" name="sdhname" maxlength="50" value="<%=rs.getString("sdhname") %>" title="Please enter the complainant's name" /></td>
	</tr>
	<tr>
		<td>Alias Name:</td>
		<td><input type='text' name='alias' maxlength='50' value="<%=rs.getString("alias") %>"/></td>
	
	<td>Nationality:<span class='style3'>*</span></td>
		 <td><input type="text" name='nationality' maxlength="30" value="<%=rs.getString("nationality") %>" /> 
      
	</td></tr>
	<tr>
			<td>Voter ID Card No:</td>
		<td ><input type='text' name='voterid' value="<%=rs.getString("name") %>" title="Please enter your voter id card no" maxlength='15' /></td>
		</tr>


	<tr>
	<td>Whether finger print has been taken:</td>
			<td colspan='2'>
			<input type='text' name='fingerprint' value="<%=rs.getString("fingerprint") %>" title="Whether the finger print taken or not." maxlength='15' />
			
			</td>
				</tr>
				<tr>
					<td valign='top'>Name and address of the witness:<span class='style3'></span></td>
					<td colspan='2'><textarea name='witness_addre' rows='s' cols='46'><%=rs.getString("witness") %></textarea></td>
				</tr>
				<%} 
else
	{
	 %>
				<tr>
					<td >Name of the court(if surrendered): </td>
					<td><input type="text" name="court" maxlength="100" title='Please enter the court name'/></td>
					<td>Acts and Sections:<span class='style3'>*</span></td>
					<td><input type="text" name="laws"  />
					</td>				
				</tr>
				<tr>
					<td colspan='2'>Select Applicable Portion:</td>
				</tr>
				<tr>
					<td colspan='2'>&nbsp;&nbsp;&nbsp;<input type="radio" checked="checked" name="applicable_portion" value='Arrested and Forwarded' />Arrested and Forwarded</td>
					<td colspan='2'><input type="radio" name="applicable_portion" value='Arrested and released on bail or PR bond'/>Arrested and released on bail or PR bond</td>
				</tr>
				<tr>
					<td colspan='2'>&nbsp;&nbsp;&nbsp;<input type="radio" name="applicable_portion" value='Arrested but released on anticipatory bail' />Arrested but released on anticipatory bail</td>
					<td colspan='2'><input type="radio" name="applicable_portion" value='Arrested and remanded to police custody'/>Arrested and remanded to police custody</td>
				</tr>
				<tr>
					<td colspan='2'>&nbsp;&nbsp;&nbsp;<input type="radio" name="applicable_portion" value='Surrendered in court and bailed out' />Surrendered in court and bailed out</td>
					<td colspan='2'><input type="radio" name="applicable_portion" value='Surrendered in court and sent to judicial custody'/>Surrendered in court and sent to judicial custody</td>
				</tr>
				<tr>
					<td colspan='2'>&nbsp;&nbsp;&nbsp;<input type="radio" name="applicable_portion" value='Surrendered in court and remanded to police custody' />Surrendered in court and remanded to police custody</td>					
				</tr>
				<tr>
				
				
				<td colspan='4'><strong>Particulars of arrested person:</strong></td>
		</tr>
		<tr>
				<td style="width: 120px">Name: <span class='style3'>*</span></td>
		<td><input type="text" name="name" maxlength="50"			title="Please enter the complainant's name"/></td>

		<td>Son/Daughter/Husband of :<span class='style3'>*</span></td>
		<td><input type="text" name="sdhname" maxlength="50" title="Please enter the complainant's name" /></td>
	</tr>
	<tr>
		<td>Alias Name:</td>
		<td><input type='text' name='alias' maxlength='50'/></td>
	
	<td>Nationality:<span class='style3'>*</span></td>
		 <td><input type="text" name='nationality' maxlength="30" /> 
      
	</td></tr>
	<tr>
			<td>Voter ID Card No:</td>
		<td ><input type='text' name='voterid' title="Please enter your voter id card no" maxlength='15' /></td>
		</tr>


	<tr>
	<td>Whether finger print has been taken:</td>
			<td colspan='2'>&nbsp;&nbsp;&nbsp;<input type="radio" name="fingerprint" value='yes' checked="checked" />Yes</td>
					<td colspan='2'><input type="radio" name="fingerprint" value='no'/>No</td>
				</tr>
				<tr>
					<td valign='top'>Name and address of the witness:<span class='style3'></span></td>
					<td colspan='2'><textarea name='witness_addre' rows='s' cols='46'></textarea></td>
				</tr>
				<%
	}
db.close();
}
catch(Exception e)
{
	out.print("Error"+e.getMessage());
}
	 %>
</table>
<table width='100%'   style='text-align:center;vertical-align: top;width:100%;background:white' >
	<tr>
		<td width="25%">&nbsp;</td>
		<td><input id="submit" type="submit" value="Submit"/><input type="hidden" name="id" value="<%=request.getParameter("id")%>" /></td>
		<td><input type="reset" value="Reset"/></td>
		<td width="25%"><span><a onclick="javascript:history.back()" style="cursor:pointer">Back</a></span></td>
		
	</tr>
	
	</table>
	</form>
	<jsp:include page='foot.jsp' flush="false"></jsp:include>
</body>
</html>