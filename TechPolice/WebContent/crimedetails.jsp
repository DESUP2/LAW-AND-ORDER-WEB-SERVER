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
        <script type="text/javascript" language="javascript">
function checkform()
	{	
			
			var msg = validateField(document.RegistrationForm.name,'NAME','1','50','Name','\'"/\\@#^,&*~-$%!');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.name.focus();
					return false;
				}
			var msg3 = validateField(document.RegistrationForm.sdhname,'NAME','1','50','Son/Daughter/Husband name','\'"/\\@#^,&*~-$%!');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.sdhname.focus();
					return false;
				}
			msg = validateField(document.RegistrationForm.add,'STRING','5','500','Address','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.add.focus();
					return false;
				}
			msg = validateField(document.RegistrationForm.crimetype,'STRING','5','500','Type of Crime','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.crimetype.focus();
					return false;
				}
			msg = validateField(document.RegistrationForm.laws,'STRING','5','500','Laws & Acts','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.laws.focus();
					return false;
				}
			var msg2 = validateField(document.RegistrationForm.major,'NAME','1','50','Major Head name','/\\@#^,&*~-$%!');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.major.focus();
					return false;
				}
			var msg1 = validateField(document.RegistrationForm.minor,'NAME','1','50','Minor Head name','/\\@#^,&*~-$%!');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.minor.focus();
					return false;
				}
			msg = validateField(document.RegistrationForm.conve,'STRING','5','50','Conveyance\'s Used','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.conve.focus();
					return false;
				}
			msg = validateField(document.RegistrationForm.propertytype,'STRING','5','50','Type of property stolen','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.propertytype.focus();
					return false;
				}
			msg = validateField(document.RegistrationForm.detail,'STRING','5','500','Detail\'s of property stolen','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.detail.focus();
					return false;
				}
			if(document.RegistrationForm.year.selectedIndex<1)
				{
					alert("Select the Year of occurance ");
					document.RegistrationForm.year.focus();
					return false;
				}
			if(document.RegistrationForm.month.selectedIndex<1)
				{
					alert("Select the Month of occurance");
					document.RegistrationForm.month.focus();
					return false;
				}
			if(document.RegistrationForm.date.selectedIndex<1)
				{
					alert("Select the Date of occurance");
					document.RegistrationForm.date.focus();
					return false;
				}
			msg=validateField(document.RegistrationForm.time_occurance,'INT','0','10','Time of occurance','@#^,&*~-$%!');
				if(msg.length>0)
				{
					alert(msg);
					document.RegistrationForm.time_occurance.focus();
					return false;
				}
			msg = validateField(document.RegistrationForm.place_occur,'STRING','5','500','Place of occurance with details','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.place_occur.focus();
					return false;
				}
			msg = validateField(document.RegistrationForm.wit_name,'STRING','5','500','witness name with details','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.wit_name.focus();
					return false;
				}
			
				
		return true;
	}	
</script>
<!--Script ends-->
<form name='RegistrationForm' action="crimefirpost.jsp" method="post" onsubmit="return checkform()" >
        <table align="center"><tr><td><h2>CRIME DETAILS </h2></td></tr></table>
        <br /> <br />
<table width='80%'    background="file:///C:/Users/sakansha/IBM/rationalsdp/workspace/TechPolice/WebContent/images/p1.png" bgcolor="#ffebb1">
			<tr>
					
					
				</tr>
	<%
	try
	{
	db.connect();
	String id=request.getParameter("id");
	ResultSet rs1=null;
	String query1="select c.ID,c.CRIMEDETAIL,t.name,t.sdhname,t.address,t.crimetype,t.major,t.minor,t.conve,t.propertytype,t.detail,t.date,t.place,t.occurence,t.witness,i.act from SAKANSHA.CRIME as i,SAKANSHA.CASES as c, xmltable('$c/crime' passing i.crimedetails as \"c\" columns name varchar(100) path 'name',sdhname varchar(50) path 'sdhname',address varchar(500) path 'address',crimetype varchar(50) path 'crimetype',major varchar(100) path 'major',minor varchar(100) path 'minor',conve varchar(100) path'conve',propertytype varchar(1000) path 'propertytype',detail varchar(2000) path 'detail',date varchar(30) path 'date',place varchar(50) path 'place',occurence varchar(6) path 'occurence',witness varchar(1000) path 'witness') as t where i.id=c.CRIMEDETAIL and c.id="+request.getParameter("id")+"";
	rs1=db.execSQL(query1);
	if(rs1.next())
	{
	 %>
	<tr>
		<td >Name: <span class='style3'>*</span></td>
		<td><input type='text' name='name' maxlength='50'  readonly="readonly" value="<%=rs1.getString("name") %>"			/></td>

		<td>Son/Daughter/Husband of :<span class='style3'>*</span></td>
		<td><input type='text' name='sdhname' maxlength='50' value="<%=rs1.getString("sdhname") %>" /></td>
	</tr>
	<tr>
	<td>Address:<span class='style3'>*</span></td>
	<td colspan='2'><textarea name='add' title='Please enter the address'  cols='46' rows='5'>
	<%=rs1.getString("address") %>
	</textarea></td>
	</tr>
	<tr>
		<td >Type of crime : <span class='style3'>*</span>
		</td>
		<td>
		<input type="text" name="crimetype" value="<%=rs1.getString("crimetype") %>"  />
		</td>
	</tr>
	<tr>
		<td>Law and Acts</td>
		<td><input type="text" name="laws" maxlength='30' value="<%=rs1.getString("act") %>" readonly="readonly"/></td>
	</tr>
	<tr>
		<td>Major Head:</td>
		<td><input type='text' name='major' maxlength='50' value="<%=rs1.getString("major") %>"/></td>
		<td>Minor Head:</td>
		<td><input type='text' name='minor' maxlength='50' value="<%=rs1.getString("minor") %>"/></td>
	</tr>
	<tr>
		<td>Conveyance(s) used:</td>
		<td><input type='text' name='conve' maxlength='50' value="<%=rs1.getString("conve") %>"/></td>
		<td>Type  of property stolen:</td>
		<td><input type='text' name='propertytype' maxlength='150' value="<%=rs1.getString("propertytype") %>" /></td>
	</tr>
	
	
	<tr>
	<td>Details of property stolen:<span class='style3'>*</span></td>
	<td colspan='2'><textarea name='detail' title='Please enter the details of property stolen' cols='46' rows='5'>
	<%=rs1.getString("detail") %>
	</textarea></td>
	</tr>
		<tr>
					
		<td colspan='2'><font color=orange>Date and time of visit to the place of occurrence:</font><span class='style3'>*</span></td>
	</tr>
	<tr><td>Date:</td>
		<td><input type="text" name='fulldate' readonly="readonly" value="<%=rs1.getString("date") %>" />
		</td>
		<td>Time:<span class='style3'>*</span></td>
					<td><input type='text' name='time_occurance' value="<%=rs1.getString("occurence") %>" maxlength='5' title='Please enter the time of occurance'/></td>
		</tr>
		<tr>
	<td>Description of the place of occurrence:<span class='style3'>*</span></td>
	<td colspan='2'><textarea name='place_occur' title='Please enter the address' cols='46' rows='5'><%=rs1.getString("place") %></textarea></td>
	</tr>
	<tr>
			<td>Witness Name   and Addresses:<span class='style3'>*</span></td>
			<td colspan='2'><textarea name='wit_name' title='Please enter the witness name and address' cols='46' rows='5'><%=rs1.getString("witness") %></textarea></td>
	</tr>
			
<%} 
else
	{
	 %>
	<tr>
		<td >Name: <span class='style3'>*</span></td>
		<td><input type='text' name='name' maxlength='50'  			/></td>

		<td>Son/Daughter/Husband of :<span class='style3'>*</span></td>
		<td><input type='text' name='sdhname' maxlength='50' /></td>
	</tr>
	<tr>
	<td>Address:<span class='style3'>*</span></td>
	<td colspan='2'><textarea name='add' title='Please enter the address' cols='46' rows='5'></textarea></td>
	</tr>
	<tr>
		<td >Type of crime : <span class='style3'>*</span>
		</td>
		<td>
		<input type="text" name="crimetype"  />
		</td>
	</tr>
	<tr>
		<td>Law and Acts</td>
		<td><input type="text" name="laws" maxlength='30' /></td>
	</tr>
	<tr>
		<td>Major Head:</td>
		<td><input type='text' name='major' maxlength='50' /></td>
		<td>Minor Head:</td>
		<td><input type='text' name='minor' maxlength='50' /></td>
	</tr>
	<tr>
		<td>Conveyance(s) used:</td>
		<td><input type='text' name='conve' maxlength='50' /></td>
		<td>Type  of property stolen:</td>
		<td><input type='text' name='propertytype' maxlength='150' /></td>
	</tr>
	
	
	<tr>
	<td>Details of property stolen:<span class='style3'>*</span></td>
	<td colspan='2'><textarea name='detail' title='Please enter the details of property stolen' cols='46' rows='5'></textarea></td>
	</tr>
		<tr>
					
		<td colspan='2'><font color=orange>Date and time of visit to the place of occurrence:</font><span class='style3'>*</span></td>
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
		<td>Time:<span class='style3'>*</span></td>
					<td><input type='text' name='time_occurance' maxlength='5' title='Please enter the time of occurance'/></td>
		</tr>
		<tr>
	<td>Description of the place of occurrence:<span class='style3'>*</span></td>
	<td colspan='2'><textarea name='place_occur' title='Please enter the address' cols='46' rows='5'></textarea></td>
	</tr>
	<tr>
			<td>Witness Name   and Addresses:<span class='style3'>*</span></td>
			<td colspan='2'><textarea name='wit_name' title='Please enter the witness name and address' cols='46' rows='5'></textarea></td>
	</tr>
			
<%}
db.close();
 }
 catch(Exception e)
 {
 out.print(e.getMessage());
 }
 %>
</table>
<table width='100%' cellspacing='5' cellpadding='5' bgcolor="#ffebb1" >
	<tr>
		<td width='25%'>&nbsp;</td>
		<td><input id='submit' type='submit' value='Submit'/><input type="hidden" name="id" value="<%=request.getParameter("id")%>"/></td>
		<td><input type='reset' value='Reset'/></td>
		<td width='25%'> <span><a onclick="javascript:history.back()" style="cursor:pointer">Back</a></span></td>
		
	</tr>
	
	</table></form>
		<jsp:include page='foot.jsp' flush="false"></jsp:include>
</body>
</html>