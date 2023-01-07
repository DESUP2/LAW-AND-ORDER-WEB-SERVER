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
      
        <!--Script starts-->
 
<script type="text/javascript" language="javascript">
function checkform()
	{	
			
				var str1=document.RegistrationForm.pass.value;
				if (str1.length==0)
					{ 
						alert("Please enter the password");
		  				form.pass.focus();
		  				return false;
		  			}
				msg = validateField(document.RegistrationForm.detail1,'STRING','5','200','Detail about the case till now','');
				if(msg.length > 0)			
					{
						alert(msg);	
						document.RegistrationForm.detail1.focus();
						return false;
					}
				msg = validateField(document.RegistrationForm.detail2,'STRING','5','200','Further necessary details','');
					if(msg.length > 0)			
					{
						alert(msg);	
						document.RegistrationForm.detail2.focus();
						return false;
					}
				msg = validateField(document.RegistrationForm.detail3,'STRING','5','200','suspecious person name to be monitored','');
					if(msg.length > 0)			
					{
						alert(msg);	
						document.RegistrationForm.detail3.focus();
						return false;
					}
				msg = validateField(document.RegistrationForm.detail4,'STRING','5','200','next action to be taken','');
					if(msg.length > 0)			
					{
						alert(msg);	
						document.RegistrationForm.detail4.focus();
						return false;
					}
				
		return true;
	}	
</script> 
<!--Script ends-->
    
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        <table align="center"><tr><td><h2><font color=teal>Detective Report/Form</font></h2></td></tr></table>
        <form name='RegistrationForm' action="detcheck.jsp" method="post" onsubmit="return checkform()">
        <table width='100%'  style='text-align:left;vertical-align: top;background:white'>
				<tr>
					<td colspan="3"  align='center'></td>
					
				</tr>
				<%
	try
	{
	db.connect();
	ResultSet rs=null;
	String query="select t.detail1,t.detail2,t.detail3,t.detail4,i.detail5 as det,c.password from sakansha.detective_detail as i,sakansha.cases as c, xmltable('$c/det' passing i.detective_detail as \"c\" columns detail1 varchar(1000) path 'detail1',detail2 varchar(1000) path 'detail2',detail3 varchar(1000) path 'detail3',detail4 varchar(1000) path 'detail4') as t where i.id=(select detective from sakansha.cases where id="+request.getParameter("id")+")";
	rs=db.execSQL(query);
	if(rs.next())
	{
	 %>
	
	 <tr>
					<td>Password</td>
					<td >
						<input name='pass' value="<%=rs.getString("password") %>" type="password" title='Please enter the password' maxlength='50'/>
						</td><td>
						<h6><b><i>Detective Can can access case through this password.</i></b></h6>
					</td>
				</tr>
				<tr>
					<td valign="top">What has been done till now?</td>
					<td>
						<textarea name="detail1"><%=rs.getString("detail1") %></textarea>
					</td>
				</tr>
				<tr>
					<td valign="top">What are the details further necessary</td>
					<td>
						<textarea name="detail2"><%=rs.getString("detail2") %></textarea>
					</td>
				</tr>
				<tr>
					<td valign="top">Any Suspecious Person who has to be monitored</td>
					<td>
						<textarea name="detail3"><%=rs.getString("detail3") %></textarea>
					</td>
				</tr>
				<tr>
					<td valign="top">Next action that will be taken</td>
					<td>
						<textarea name="detail4"><%=rs.getString("detail4") %></textarea>
					</td>
				</tr>
				<tr>
					<td valign="top">Comments from the Detective</td>
					<td>
						<textarea name="detail5"><%=rs.getString("det") %></textarea>
					</td>
				</tr>
		<%} 
else
	{
	 %>
	  <tr>
					<td>Password</td>
					<td >
						<input name='pass' type="password" title='Please enter the password' maxlength='50'/>
						</td><td>
					<h6>	<b><i>Detective Can can access case through this password.</i></b></h6>
					</td>
				</tr>
				<tr>
					<td valign="top">What has been done till now?</td>
					<td>
						<textarea name="detail1"></textarea>
					</td>
				</tr>
				<tr>
					<td valign="top">What are the details further necessary</td>
					<td>
						<textarea name="detail2"></textarea>
					</td>
				</tr>
				<tr>
					<td valign="top">Any Suspecious Person who has to be monitored</td>
					<td>
						<textarea name="detail3"></textarea>
					</td>
				</tr>
				<tr>
					<td valign="top">Next action that will be taken</td>
					<td>
						<textarea name="detail4"></textarea>
					</td>
				</tr>
	 <%}
db.close();
 }
 catch(Exception e)
 {
 out.print(e.getMessage());
 }
 %>

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

</table></form>
<jsp:include page='foot.jsp' flush="false"></jsp:include>
</body>
</html>