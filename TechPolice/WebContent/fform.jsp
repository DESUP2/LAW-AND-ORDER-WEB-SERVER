<DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/dropdown-menu.css" rel="stylesheet" type="text/css" />
<jsp:useBean id="db" class="database.dncon" />
 <%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
  <%@page import="java.util.Date" %> <%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
  <%@page import="java.util.Date" %>
  
<script type="text/javascript" src="techfiles/ajax.js"></script>
<script type="text/javascript" src="techfiles/othervalids.js"></script>
<script type="text/javascript" src="techfiles/valids.js"></script>
<title>FIR/Petty Cases| LAW &amp; ORDER</title>
</head>

<body>
<jsp:include page='head.jsp' flush="false"></jsp:include>
<!--Script starts-->

<script type="text/javascript" language="javascript">
function checkform()
	{	
	msg = validateField(document.RegistrationForm.court,'STRING','5','50','Name of the Court','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.court.focus();
					return false;
				}
				if(document.RegistrationForm.year.selectedIndex<1)
				{
					alert("Select year of F.I.R filed");
					document.RegistrationForm.year.focus();
					return false;
				}
				if(document.RegistrationForm.month.selectedIndex<1)
				{
					alert("Select month of F.I.R filed");
					document.RegistrationForm.month.focus();
					return false;
				}
				if(document.RegistrationForm.date.selectedIndex<1)
				{
					alert("Select date of F.I.R filed");
					document.RegistrationForm.date.focus();
					return false;
				}
			msg = validateField(document.RegistrationForm.laws,'STRING','5','200','Acts & Sections','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.laws.focus();
					return false;
				}
			/*	var checkbox = document.RegistrationForm.type_fr;			
				if(!checkbox.checked)			
				{
					alert("Select");					
					return false;
				}	
				var checkbox = document.RegistrationForm.type_fr1;			
				if(!checkbox.checked)			
				{
					alert("Select11");					
					return false;
				}	*/

				
			var msg = validateField(document.RegistrationForm.complai_name,'NAME','1','50','Comlainant\'s Name','\'"/\\@#^,&*~-$%!');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.complai_name.focus();
					return false;
				}
			var msg = validateField(document.RegistrationForm.father_name,'NAME','1','50','Comlainant Father\' Name','\'"/\\@#^,&*~-$%!');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.father_name.focus();
					return false;
				}
			var msg = validateField(document.RegistrationForm.accu_name,'NAME','1','50','Accused person Name','\'"/\\@#^,&*~-$%!');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.accu_name.focus();
					return false;
				}	
			var msg = validateField(document.RegistrationForm.accu_father_name,'NAME','1','50','Accused  person Father\'s Name','\'"/\\@#^,&*~-$%!');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.accu_father_name.focus();
					return false;
				}
				if(document.RegistrationForm.year1.selectedIndex<1)
				{
					alert("Select accused person Year of Birth");
					document.RegistrationForm.year1.focus();
					return false;
				}
				if(document.RegistrationForm.month1.selectedIndex<1)
				{
					alert("Select accused person Month of Birth");
					document.RegistrationForm.month1.focus();
					return false;
				}
				if(document.RegistrationForm.date1.selectedIndex<1)
				{
					alert("Select accused person Date of Birth");
					document.RegistrationForm.date1.focus();
					return false;
				}
			var msg = validateField(document.RegistrationForm.occupation,'NAME','1','50','Occupation','/\\@#^,&*~-$%!');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.occupation.focus();
					return false;
				}
			msg = validateField(document.RegistrationForm.add,'STRING','5','1000','Full Address ','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.add.focus();
					return false;
				}
			msg = validateField(document.RegistrationForm.bailer,'STRING','5','1000','Details of Bailers/Sureties','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.bailer.focus();
					return false;
				}
			msg = validateField(document.RegistrationForm.result_library,'STRING','5','1000','Result of Analysis','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.result_library.focus();
					return false;
				}
			msg = validateField(document.RegistrationForm.brieffacts,'STRING','5','1000','Brief facts of case','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.brieffacts.focus();
					return false;
				}
				if(document.RegistrationForm.year2.selectedIndex<1)
				{
					alert("Select Year of Despatch of case file");
					document.RegistrationForm.year2.focus();
					return false;
				}
				if(document.RegistrationForm.month2.selectedIndex<1)
				{
					alert("Select Month of Despatch of case file");
					document.RegistrationForm.month2.focus();
					return false;
				}
				
		return true;
	}	
</script>
<!--Script ends-->
<div id="content">
        
        
        <div id="content_top"></div>
        <div id="content_main">
        <table align="center"><tr><td><h2><font color=teal>MAIN REPORT</font></h2></td></tr></table>
      <form name='RegistrationForm' action="fformcheck.jsp" method="post" onsubmit="return checkform()">
      <table width='100%' >
				<tr>
					<td colspan="4" align='center'><h3 style="display:inline"></h3></td>
					
				</tr>
				
		<%
	try
	{
	db.connect();
	ResultSet rs=null;
	String query="select t.court,t.date,t.type_fr,t.type_fr1,t.complai_name,t.father_name,t.accu_name,t.accu_father_name,t.date1,t.occupation,t.add,t.bailer,t.result_library,t.brieffacts,t.date2,i.act from SAKANSHA.MAINREPORT as i, xmltable('$c/final' passing i.REPORT as \"c\" columns court varchar(50) path 'court',date varchar(20) path 'date',type_fr varchar(500) path 'type_fr',type_fr1 varchar(500) path 'type_fr1',complai_name varchar(50) path 'complai_name',father_name varchar(50) path 'father_name',accu_name varchar(50) path 'accu_name',accu_father_name varchar(50) path 'accu_father_name',date1 varchar(20) path 'date1',occupation varchar(50) path 'occupation',add varchar(400) path 'add',bailer varchar(50) path 'bailer',result_library varchar(500) path 'result_library',brieffacts varchar(500) path 'brieffacts',date2 varchar(20) path 'date2') as t where i.id=(select final from SAKANSHA.CASES where id="+request.getParameter("id")+")";
	rs=db.execSQL(query);
	if(rs.next())
	{
	 %>
				<tr>
					<td>In the court of</td>
					<td colspan='3'><input name='court' value="<%=rs.getString("court") %>" title='Please enter the court name' maxlength='50'/></td>
				</tr>
				
				
				<tr>
					<td>Date:</td>
					<td>
							<input name='fullyear' value="<%=rs.getString("date") %>" title='Please enter the date in the given format.' maxlength='50'/>	
					</td>
				</tr>
				<tr>
					<td>Acts and Section: </td>
					<td>
					<input type="text" name="laws"  value="<%=rs.getString("act") %>"/>
					</td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td colspan='2'>Type of Final Form/Report:</td>
				</tr>
				<tr>
				<td colspan="4"><textarea name="type_fr" cols="75"><%=rs.getString("type_fr") %></textarea></td>
					
				</tr>
				<tr>
					<td colspan='2'>If FR Unoccured:</td>
					

				</tr>
				<tr>
					<td colspan="4"><textarea name="type_fr1" cols="75"><%=rs.getString("type_fr1") %></textarea></td>
				</tr>
				
				
				<tr>
					<td>Name of Complainant:</td>
					<td><input type='text' name='complai_name' maxlength='50' value="<%=rs.getString("complai_name") %>" title='Please enter the complainants name'/></td>
					<td>Father/Husband's Name:</td>
					<td ><input type='text' name='father_name' maxlength='50' value="<%=rs.getString("father_name") %>" title='Please enter the complainants father/husband name'/></td>
				</tr>
				
			
				<tr>
					<td colspan='4'><strong>Particulars of accused persons charge-sheeted:</strong></td>
				</tr>
				<tr>
					<td>Name :</td>
					<td><input type='text' name='accu_name' maxlength='50' value="<%=rs.getString("accu_name") %>" title='Please enter the accused person name'/></td>
					<td>Father/Husband's Name:</td>
					<td><input type='text' name='accu_father_name' maxlength='50' value="<%=rs.getString("accu_father_name") %>" title='Please enter the accused persons father/husband name'/></td>
				</tr>
				<tr>
					<td>Date of Birth:</td>

					<td>
								<input name='fullyear1' value="<%=rs.getString("date1") %>" title='Please enter the date in the given format.' maxlength='50'/>	
					</td>
					
	<td>Occupation:<span class='style3'>*</span></td>
		<td>
			<input type="text" value="<%=rs.getString("occupation") %>" name="occupation" maxlength="25" />
		</td>
		 
	</tr>
	<tr>
		<td style="vertical-align: top">Address:</td>
		<td><textarea name='add' rows='10'><%=rs.getString("add") %></textarea></td>
		<td style="vertical-align: top"> Details of Bailers/Sureties:</td>
		<td ><textarea name='bailer' rows='10'><%=rs.getString("bailer") %></textarea></td>
	</tr>
	
	<tr>
		<td>Results of Library Analysis:</td>
		<td colspan='3'><textarea  name='result_library'><%=rs.getString("result_library") %></textarea></td>
	</tr>
	<tr>
		<td>Brief facts of the case:</td>
		<td colspan='3'><textarea name='brieffacts'><%=rs.getString("brieffacts") %></textarea></td>
	</tr>
	<tr>
		<td>Despatched on:</td>
		<td>
								<input name='fullyear2' value="<%=rs.getString("date2") %>" title='Please enter the date in the given format.' maxlength='50'/>	
					</td>
	</tr>
	<%} 
else
	{
	 %>
	 <tr>
					<td>In the court of</td>
					<td colspan='3'><input name='court' title='Please enter the court name' maxlength='50'/></td>
				</tr>
				
				
				<tr>
					<td>Date:</td>
					<td>
								<select name="year" onchange="listdate(document.RegistrationForm.month.value,this.value)">
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
								<select name="month" onchange="listdate(this.value,document.RegistrationForm.year.value)">
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
								</select>
							<span id="dateselDIV">
								<select name="date">
									<option>dd</option>
								</select>
						 	</span>
					</td>
				</tr>
				<tr>
					<td>Acts and Section: </td>
					<td>
					<input type="text" name="laws"/>
					</td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td colspan='2'>Type of Final Form/Report:</td>
				</tr>
				<tr>
					<td colspan='2'>&nbsp;&nbsp;&nbsp;<input type="checkbox" name="type_fr" value='Charge Sheet/Not charge sheeted for want of evidence/FR True' />Charge Sheet/Not charge sheeted for want of evidence/FR True</td>
					<td colspan='2'><input type="checkbox" name="type_fr" value='Undetected/FR True'/>Undetected/FR True</td>
				</tr>
				<tr>
					<td colspan='2'>&nbsp;&nbsp;&nbsp;<input type="checkbox" name="type_fr" value='Untraced/FR True' />Untraced/FR True</td>
					<td colspan='2'><input type="checkbox" name="type_finalform" value='Offence abated/FR Unoccured'/>Offence abated/FR Unoccured</td>
				</tr>
				<tr>
					<td colspan='2'>If FR Unoccured:</td>
					

				</tr>
				<tr>
					<td colspan='2'>&nbsp;&nbsp;&nbsp;<input type="checkbox" name="type_fr1" value='False' />False</td>
					<td colspan='2'><input type="checkbox" name="type_fr1" value='Mistake of Fact'/>Mistake of Fact</td>
					
				</tr>
				<tr>
					<td colspan='2'>&nbsp;&nbsp;&nbsp;<input type="checkbox" name="type_fr1" value='Mistake of Law' />Mistake of Law</td>
					<td colspan='2'><input type="checkbox" name="type_fr1" value='Non Cognisable'/>Non Cognisable</td>

				</tr>
				<tr>
					<td colspan='2'>&nbsp;&nbsp;&nbsp;<input type="checkbox" name="type_fr1" value='Civil nature'/>Civil nature</td>
				</tr>
				
				<tr>
					<td>Name of Complainant:</td>
					<td><input type='text' name='complai_name' maxlength='50' title='Please enter the complainants name'/></td>
					<td>Father/Husband's Name:</td>
					<td ><input type='text' name='father_name' maxlength='50' title='Please enter the complainants father/husband name'/></td>
				</tr>
				
			
				<tr>
					<td colspan='4'><strong>Particulars of accused persons charge-sheeted:</strong></td>
				</tr>
				<tr>
					<td>Name :</td>
					<td><input type='text' name='accu_name' maxlength='50' title='Please enter the accused person name'/></td>
					<td>Father/Husband's Name:</td>
					<td><input type='text' name='accu_father_name' maxlength='50' title='Please enter the accused persons father/husband name'/></td>
				</tr>
				<tr>
					<td>Date of Birth:</td>

					<td>
								<select name="year1" onchange="listdate1(document.RegistrationForm.month1.value,this.value)">
								<option value='0'>year</option>
								<%
			Date date1=new Date();


			//SimpleDateFormat simpleDateformat=new SimpleDateFormat("yyyy");
			int a1=Integer.parseInt(simpleDateformat.format(date1));
			for(int i=a1;i>=1947;--i)
			{
			%>
			<option value='<%=i %>'><%=i %></option>
			<%
			}
			
			 %>	
								</select> 
								<select name="month1" onchange="listdate1(this.value,document.RegistrationForm.year1.value)">
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
								</select>
							<span id="datesel1DIV">
								<select name="date1">
									<option>dd</option>
								</select>
						 	</span>
					</td>
					
	<td>Occupation:<span class='style3'>*</span></td>
		<td>
			<input type="text" name="occupation" maxlength="25" />
		</td>
		 
	</tr>
	<tr>
		<td style="vertical-align: top">Address:</td>
		<td><textarea name='add' rows='10'></textarea></td>
		<td style="vertical-align: top"> Details of Bailers/Sureties:</td>
		<td ><textarea name='bailer' rows='10'></textarea></td>
	</tr>
	
	<tr>
		<td>Results of Library Analysis:</td>
		<td colspan='3'><textarea name='result_library'></textarea></td>
	</tr>
	<tr>
		<td>Brief facts of the case:</td>
		<td colspan='3'><textarea name='brieffacts'></textarea></td>
	</tr>
	<tr>
		<td>Despatched on:</td>
		<td>
								<select name="year2" onchange="listdate2(document.RegistrationForm.month2.value,this.value)">
								<option value='0'>year</option>
								<%
			
			for(int i=a1;i>=1947;--i)
			{
			%>
			<option value='<%=i %>'><%=i %></option>
			<%
			}
			
			 %>	
								</select> 
								<select name="month2" onchange="listdate2(this.value,document.RegistrationForm.year2.value)">
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
								</select>
							<span id="datesel2DIV">
								<select name="date2">
									<option>dd</option>
								</select>
						 	</span>
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
	

</table></form>
      <jsp:include page='foot.jsp' flush="false"></jsp:include>
</body>
</html>