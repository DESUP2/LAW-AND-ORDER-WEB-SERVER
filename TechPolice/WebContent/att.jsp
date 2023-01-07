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
      
        
    
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        <!--Script starts-->

<script type="text/javascript" language="javascript">
function checkform()
	{	
			
				msg = validateField(document.RegistrationForm.desc,'STRING','5','200','Description of File','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.desc.focus();
					return false;
				}
				if(document.RegistrationForm.file.value.length == 0)			
				{
					alert("Please Upload a file");	
					document.RegistrationForm.file.focus();
					return false;
				}
		return true;
	}	
</script>
<!--Script ends-->
<table align="center"><tr><td><font color=teal><h2>Attaching additional files to this case</h2><h6>(Fingerprint images,medical reports,etc.,)</h6></font></td></tr></table>
<form name='RegistrationForm' action="attcheck.jsp" method="post" onsubmit="return checkform()" enctype="multipart/form-data">
<table width='100%'  style='text-align:left;vertical-align: top;background:white'>
				<tr>
					<td align='center' colspan="2"><h3 style="display:inline"></h3></td>
					
				</tr>
				<tr>
					<td>Description of file</td>
					<td><input type="text" name="desc"/></td>
				</tr>
					<tr>
					<td>File Location</td>
					<td><input type="file" name="file"/></td>
				</tr>
	

	<tr>
		<td colspan='4'>
		<table width='100%'  cellspacing='5' cellpadding="5"  style='text-align:center;vertical-align: top'>
		<tr>
		<td width="25%">&nbsp;</td>
		<td><input id="submit" type="submit" value="Submit"/><input type="hidden" name="id" value="<%=request.getParameter("id")%>"/></td>
		<td><input type="reset" value="Reset"/></td>
		<td width="25%"><span><a onclick="javascript:history.back()" style="cursor:pointer">Back</a></span></td>
		
	</tr>
	</table>
		</td>
	</tr>
	<tr>
		<td>
			Already Attached Files
			<table width="100%">
					<tr>
						<td>
						<strong>File</strong>
						</td>
						<td>
						<strong>Description</strong>
						</td>
					</tr>
					<%
					db.connect();
					String query="select * from SAKANSHA.UPLOAD where case="+request.getParameter("id");
					ResultSet rs=db.execSQL(query);
					while(rs.next())
					{
						%>
					<tr>
						<td>
						<a href="upload/casefiles/<%=rs.getString("location") %>" target="_blank">File1</a>
						</td>
						<td>
						<%=rs.getString("desc") %>
						</td>
					</tr>
						<%
					}
					db.close();
					 %>
					
			</table>	
		</td>
		
	</tr>

</table>
<jsp:include page='foot.jsp' flush="false"></jsp:include>
        
</body>
</html>