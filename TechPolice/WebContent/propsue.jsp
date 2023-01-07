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

<script  type="text/javascript" language="javascript" >

function checkform()
	{	
				
				msg = validateField(document.RegistrationForm.laws,'STRING','5','200','Acts & Sections','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.laws.focus();
					return false;
				}
				if(document.RegistrationForm.propertytype.selectedIndex<1)
				{
					alert("Select nature of property seized");
					document.RegistrationForm.propertytype.focus();
					return false;
				}
				if(document.RegistrationForm.year.selectedIndex<1)
				{
					alert("Select year of occurance");
					document.RegistrationForm.year.focus();
					return false;
				}
				if(document.RegistrationForm.month.selectedIndex<1)
				{
					alert("Select month of occurance");
					document.RegistrationForm.month.focus();
					return false;
				}
				if(document.RegistrationForm.date.selectedIndex<1)
				{
					alert("Select date of occurance");
					document.RegistrationForm.date.focus();
					return false;
				}
			//		msg = validateField(document.RegistrationForm.time_occurance,'STRING','5','50','Time of occurance','');
			//	if(msg.length > 0)			
			//	{
			//		alert(msg);	
			//		document.RegistrationForm.time_occurance.focus();
			//		return false;
			//	}
				msg = validateField(document.RegistrationForm.place,'STRING','5','50','Place of occurance','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.place.focus();
					return false;
				}
				msg = validateField(document.RegistrationForm.place_property_Seized,'STRING','5','50','place of property seized','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.place_property_Seized.focus();
					return false;
				}
				var msg = validateField(document.RegistrationForm.name,'NAME','1','50','complainant\'s Name','/\\@#^,&*~-$%!');
						if(msg.length > 0)			
						{
							alert(msg);	
							document.RegistrationForm.name.focus();
							return false;
						}	
				var msg = validateField(document.RegistrationForm.sdhname,'NAME','1','50','complainant Father\'s Name','/\\@#^,&*~-$%!');
						if(msg.length > 0)			
						{
							alert(msg);	
							document.RegistrationForm.sdhname.focus();
							return false;
						}	
				var msg = validateField(document.RegistrationForm.occupation,'NAME','1','50','Occupation of Complainant','\'"/\\@#^,&*~-$%!');
						if(msg.length > 0)			
						{
							alert(msg);	
							document.RegistrationForm.occupation.focus();
							return false;
						}
				msg = validateField(document.RegistrationForm.person_addre,'STRING','5','50','Address of Complainant','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.person_addre.focus();
					return false;
				}	
				var msg = validateField(document.RegistrationForm.w_name,'NAME','1','50','Witness name ','/\\@#^,&*~-$%!');
						if(msg.length > 0)			
						{
							alert(msg);	
							document.RegistrationForm.w_name.focus();
							return false;
						}	
				var msg = validateField(document.RegistrationForm.w_sdhname,'NAME','1','50','Witnesses Father\'s name ','/\\@#^,&*~-$%!');
						if(msg.length > 0)			
						{
							alert(msg);	
							document.RegistrationForm.w_sdhname.focus();
							return false;
						}	
				var msg = validateField(document.RegistrationForm.occupation1,'NAME','1','50','Witness Occupation','/\\@#^,&*~-$%!');
						if(msg.length > 0)			
						{
							alert(msg);	
							document.RegistrationForm.occupation1.focus();
							return false;
						}
				msg = validateField(document.RegistrationForm.witness_addre,'STRING','5','50','Witness Address','');
						if(msg.length > 0)			
						{
							alert(msg);	
							document.RegistrationForm.witness_addre.focus();
							return false;
						}	
				msg = validateField(document.RegistrationForm.witness_detail,'STRING','5','50','Detail of Property Seized seen by Witness','');
						if(msg.length > 0)			
						{
							alert(msg);	
							document.RegistrationForm.witness_detail.focus();
							return false;
						}	
		return true;
	}	
	
</script>
<!--Script ends-->
        
    
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        <table align="center"><tr><td><h2><font color=teal>Property Seizure &amp; Search </font></h2></td></tr></table>
        
        
<form name='RegistrationForm' action="propsuecheck.jsp" onsubmit="return checkform()" method="post">

<table width='99%' style='text-align:left;vertical-align: top;background:white'>
			<tr>
					<td colspan="4" align='center'></td>
					
				</tr>
	<%
	try
	{
	db.connect();
	ResultSet rs=null;
	String query="select i.act,t.propertytype,t.date,t.time,t.place,t.placedes,t.name,t.sdhname,t.occupation,t.person_addre,t.w_name,t.w_sdhname,t.occupation1,t.witness_detail,witness_addre from sakansha.propertydetails as i, xmltable('$c/property' passing i.proprty as \"c\" columns propertytype varchar(50) path 'propertytype',date varchar(20) path 'date',place varchar(50) path 'place',time varchar(6) path 'time',placedes varchar(50) path 'placedes', name varchar(100) path 'name',sdhname varchar(50) path 'sdhname',person_addre varchar(500) path 'person_addre',occupation varchar(50) path 'occupation',w_name varchar(100) path 'w_name',w_sdhname varchar(50) path 'w_sdhname',witness_addre varchar(500) path 'witness_addre',occupation1 varchar(50) path 'occupation1',witness_detail varchar(500) path 'witness_detail') as t where i.id=(select property from sakansha.cases where id="+request.getParameter("id")+")";
	rs=db.execSQL(query);
	if(rs.next())
	{%>
				<tr>
					<td>Acts and Sections:<span class='style3'>*</span></td>
					<td>
					<input readonly="readonly" type="text" name="laws" value="<%=rs.getString("act") %>" />
					</td>				
					<td>Nature of Property seized:</td>
					<td>
						<input readonly="readonly" type="text"	 name='propertytype' value="<%=rs.getString("propertytype") %>"/>
							
					</td>
				</tr>
				<tr>
					<td colspan='2'><strong>Property seized/recovered:</strong></td>
				</tr>
				<tr>
				<td>Date:</td>
				<td>
				<input type="text" readonly="readonly" name="fulldate" value="<%=rs.getString("date") %>"/>
		</td>
		<td>Time:</td>
		<td width="419">
			<input type="text" name="time" id="time" /> 
			<div id="time3_picker" class="time_picker_div"></div>
		</td>
	</tr>
	<tr>
		<td>Place:</td>
		<td><input type='text' name='place' readonly="readonly" maxlength='100' title='Please enter the place of property seized' value="<%=rs.getString("place") %>" /></td>
		<td>Description of the place:</td>
		<td><textarea name='place_property_seized' readonly="readonly"><%=rs.getString("placedes") %></textarea></td>
	</tr>
	<tr>
		<td colspan='2'><strong>Person from whom seized/recovered:<span class='style3'>*</span></strong></td>
	</tr>
	<tr>
		<td style="width: 120px">Name: <span class='style3'>*</span></td>
		<td><input type="text" value="<%=rs.getString("name") %>" name="name" maxlength="50" title="Please enter the complainant's name"/></td>
		<td>Son/Daughter/Husband of :<span class='style3'>*</span></td>
		<td><input type="text" value="<%=rs.getString("sdhname") %>" name="sdhname" maxlength="50" title="Please enter the complainant's name" /></td>
	</tr>
	<tr>
		<td>Occupation:</td>
		<td>
			<input type="text" name="occupation" value="<%=rs.getString("occupation") %>" />
		</td>
		<td>Address:</td>
		<td><textarea name='person_addre' ><%=rs.getString("person_addre") %></textarea></td>
	</tr>
	<tr>
		<td colspan='4'><strong>Witnesses:</strong></td>
	</tr>
	<tr>
		<td style="width: 120px">Name: <span class='style3'>*</span></td>
		<td><input type="text" value="<%=rs.getString("w_name") %>" name="w_name" maxlength="50" title="Please enter the complainant's name"/></td>
		<td>Son/Daughter/Husband of :<span class='style3'>*</span></td>
		<td><input type="text" value="<%=rs.getString("w_sdhname") %>" name="w_sdhname" maxlength="50" title="Please enter the complainant's name" /></td>
	</tr>
	<tr>
		<td>Occupation:</td>
		<td>
			<input type="text" name="occupation1" value="<%=rs.getString("occupation1") %>" />
		</td>
		
	</tr>
	<tr>
		<td colspan='2'>Name and address of the witness:<span class='style3'>*</span></td>
		<td colspan='2'><textarea name='witness_addre'  rows='s' cols='46'><%=rs.getString("witness_addre") %></textarea></td>
	</tr>
	<tr>
		<td colspan='2'>Details of property seized:<span class='style3'>*</span></td>
		<td colspan='2'><textarea name='witness_detail' rows='s' cols='46'><%=rs.getString("witness_detail") %></textarea></td>
	</tr>
	<%} 
else
	{%>
				<tr>
					<td>Acts and Sections:<span class='style3'>*</span></td>
					<td>
					<input type="text" name="laws" />
					</td>				
					<td>Nature of Property seized:</td>
					<td>
						<select name='propertytype'>
							<option value='0'>Select</option>
							<option value='Stolen'>Stolen</option>
							<option value='Unclaimed'>Unclaimed</option>
							<option value='Unlawful possession'>Unlawful possession</option>
							<option value='Involved'>Involved</option>
							<option value='Inestate'>Inestate</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan='2'><strong>Property seized/recovered:</strong></td>
				</tr>
				<tr>
				<td>Date:</td>
				<td><select name="year" onchange="listdate(document.RegistrationForm.month.value,this.value)">
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
			</select> <select name="month" onchange="listdate(this.value,document.RegistrationForm.year.value)">
				<option value="0">mon</option>
				<option value="01">jan</option>
				<option value="02">feb</option>
				<option value="03">mar</option>
				<option value="04">apr</option>
				<option value="05">may</option>
				<option value="06">jun</option>
				<option value="07">jul</option>
				<option value="08">aug</option>
				<option value="09">sep</option>
				<option value="10">oct</option>
				<option value="11">nov</option>
				<option value="12">dec</option>
			</select><span id="dateselDIV">
					<select name="date">
					<option>dd</option>
					</select> </span>
		</td>
		<td>Time:</td>
		<td><input type='text' name='time' maxlength='5' title='Please enter the time of property seized'/></td>
	</tr>
	<tr>
		<td>Place:</td>
		<td><input type='text' name='place' maxlength='100' title='Please enter the place of property seized' /></td>
		<td>Description of the place:</td>
		<td><textarea name='place_property_seized' ></textarea></td>
	</tr>
	<tr>
		<td colspan='2'><strong>Person from whom seized/recovered:<span class='style3'>*</span></strong></td>
	</tr>
	<tr>
		<td style="width: 120px">Name: <span class='style3'>*</span></td>
		<td><input type="text" name="name" maxlength="50" title="Please enter the complainant's name"/></td>
		<td>Son/Daughter/Husband of :<span class='style3'>*</span></td>
		<td><input type="text" name="sdhname" maxlength="50" title="Please enter the complainant's name" /></td>
	</tr>
	<tr>
		<td>Occupation:</td>
		<td>
			<input type="text" name="occupation" />
		</td>
		<td>Address:</td>
		<td><textarea name='person_addre' ></textarea></td>
	</tr>
	<tr>
		<td colspan='4'><strong>Witnesses:</strong></td>
	</tr>
	<tr>
		<td style="width: 120px">Name: <span class='style3'>*</span></td>
		<td><input type="text" name="w_name" maxlength="50" title="Please enter the complainant's name"/></td>
		<td>Son/Daughter/Husband of :<span class='style3'>*</span></td>
		<td><input type="text" name="w_sdhname" maxlength="50" title="Please enter the complainant's name" /></td>
	</tr>
	<tr>
		<td>Occupation:</td>
		<td>
			<input type="text" name="occupation1" />
		</td>
		
	</tr>
	<tr>
		<td colspan='2'>Name and address of the witness:<span class='style3'>*</span></td>
		<td colspan='2'><textarea name='witness_addre' rows='s' cols='46'></textarea></td>
	</tr>
	<tr>
		<td colspan='2'>Details of property seized:<span class='style3'>*</span></td>
		<td colspan='2'><textarea name='witness_detail' rows='s' cols='46'></textarea></td>
	</tr>
	<%
	}
	db.close();
 }
 catch(Exception e)
 {
 out.print(e.getMessage());
 }
	 %>
	<tr>
		<td colspan='4'>The above mentioned properties were seized in accordance with the provisions of law in the presence of the above said witnesss and a copy of the seizure form was given to the person/the occupant of the place from whom seized</td>
	</tr>
	<tr>
		<td colspan='4'>
		
		<table width='97%'  cellspacing='5' cellpadding="5"  style='text-align:center;vertical-align: top'>
	<tr>
		<td width="25%">&nbsp;</td>
		<td><input id="submit" type="submit" value="Submit"/><input type="hidden" name="id" value="<%=request.getParameter("id")%>"/></td>
		<td><input type="reset" value="Reset"/></td>
		<td width="25%"> <span><a onclick="javascript:history.back()" style="cursor:pointer">Back</a></span></td>
		
	</tr>
	
	</table>
		
		</td>
	</tr>
</table>
</form>
<jsp:include page='foot.jsp' flush="false"></jsp:include>
</body>
</html>