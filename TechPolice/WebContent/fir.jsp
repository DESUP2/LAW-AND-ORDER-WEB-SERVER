<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page language="java" import="java.sql.*" %>
<%@page language="java" import="java.util.Date" %>
 <%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
  <%@page import="java.util.Date" %>
  <%@page language="java" import="java.io.*, javax.swing.*, java.awt.*,
java.sql.*, java.util.*, net.sf.jasperreports.engine.*,
net.sf.jasperreports.view.*;" %>
<html>
<head>
<title>fir</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script language="javascript" src="techfiles/mootools.v1.11.js"></script>
<script language="javascript" src="techfiles/nogray_time_picker_min.js"></script>
<script language="javascript">
	window.addEvent("domready", function (){
		
		var tp2 = new TimePicker('time2_picker', 'time_occurance', 'time2_toggler', {format24:true});
		
		
	});
</script>

<style>
	* {font-family:Arial, Helvetica, sans-serif;
		font-size:9pt;}
		
	/* table list */
	.table_list {border-collapse:collapse;
		border:solid #cccccc 1px;
		width:100%;}
	
	.table_list td {padding:5px;
		border:solid #efefef 1px;}
	
	.table_list th {background:#75b2d1;
		padding:5px;
		color:#ffffff;}
	
	.table_list tr.odd {background:#e1eff5;}
	
	.time_picker_div {padding:5px;
		border:solid #999999 1px;
		background:#ffffff;}
		
</style>



<script  type="text/javascript" language="javascript" >
function changecolor(a)
{
//alert("hi");
	
	 if(a==1)
		{
		
		
		
		document.getElementById("listall").innerHTML="";
		citizensignup(1)
		}
		if(a==2)
		{
		
		
		
		document.getElementById("listall").innerHTML="";
		detectivesignup(1)
		}
		if(a==3)
		{
		
		
		
		document.getElementById("listall").innerHTML="";
		complaints(1)
		}
	else
		{
		document.getElementById("listall").innerHTML="element"+a+" Loading...";
		}
	
	a='menu-item'+a;
	// alert(a);
	
		for(i=1;i<7;i++)
	{
	
	b="menu-item"+i;
	// alert(b);
	var elem=document.getElementById(b);
	elem.style.background="none";
	
	}
	
	var elem1 = document.getElementById(a);
	 elem.style.background = "#f3f3f3";
	
	 




}

</script>
<!--Script starts-->
<script>

function checkform()
	{	

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
					
				if(document.RegistrationForm.time_occurance.value.length == 0)			
				{
					alert("Please enter the time of occurance");	
					document.RegistrationForm.time_occurance.focus();
					return false;
				}
				if(document.RegistrationForm.year1.selectedIndex<1)
				{
					alert("Select year of Reporting");
					document.RegistrationForm.year1.focus();
					return false;
				}
				if(document.RegistrationForm.month1.selectedIndex<1)
				{
					alert("Select month of Reporting");
					document.RegistrationForm.month1.focus();
					return false;
				}
				if(document.RegistrationForm.date1.selectedIndex<1)
				{
					alert("Select date of Reporting");
					document.RegistrationForm.date1.focus();
					return false;
				}
		
				//if(document.RegistrationForm.time_report.value.length == 0)			
				//{
				//	alert("Please enter the time of reporting");	
				//	document.RegistrationForm.time_report.focus();
			//		return false;
			//	}
		
				msg = validateField(document.RegistrationForm.occu_place,'STRING','5','1000','Place of Occurance','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.occu_place.focus();
					return false;
				}
				msg = validateField(document.RegistrationForm.particulars,'STRING','5','1000','Particulars of property stolen','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.particulars.focus();
					return false;
				}
				msg=validateField(document.RegistrationForm.totalvalue,'INT','0','10','Total Value of property stolen','@#^,&*~-$%!');
				if(msg.length>0)
				{
					alert(msg);
					document.RegistrationForm.totalvalue.focus();
					return false;
				}			
			var msg = validateField(document.RegistrationForm.name,'NAME','1','50','Complainant\'s Name','/\\@#^,&*~-$%!');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.name.focus();
					return false;
				}
			var msg1 = validateField(document.RegistrationForm.sdhname,'NAME','1','50','Complainant Father\'s Name','/\\@#^,&*~-$%!');
				if(msg1.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.sdhname.focus();
					return false;
				}
			var msg2 = validateField(document.RegistrationForm.nationality,'NAME','1','50','Nationality of complainant','/\\@#^,&*~-$%!');
				if(msg2.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.nationality.focus();
					return false;
				}
			var msg3 = validateField(document.RegistrationForm.occupation,'NAME','1','50','Occupation of complainant','\'"/\\@#^,&*~-$%!');
				if(msg3.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.occupation.focus();
					return false;
				}	
			msg = validateField(document.RegistrationForm.complaint,'STRING','5','1000','Details of Complaint','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.complaint.focus();
					return false;
				}
			var a=document.RegistrationForm.first.value;
			if(!(a==""))
				{
					var msg4 = validateField(document.RegistrationForm.first,'NAME','1','50','First Suspect Name','\'"/\\@#^,&*~-$%!');
						if(msg4.length > 0)			
						{
							alert(msg);	
							document.RegistrationForm.first.focus();
							return false;
						}		
				}
				var b=document.RegistrationForm.second.value;
			if(!(b==""))
				{
					var msg5 = validateField(document.RegistrationForm.second,'NAME','1','50','Second Suspect Name','\'"/\\@#^,&*~-$%!');
						if(msg5.length > 0)			
						{
							alert(msg);	
							document.RegistrationForm.second.focus();
							return false;
						}	
				}
			msg = validateField(document.RegistrationForm.firsummary,'STRING','5','1000','Summary of F.I.R','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.firsummary.focus();
					return false;
				}
			
				
		return true;
	}	
</script>
<!--Script ends-->



</head>
<jsp:include page='head.jsp' flush="false"></jsp:include>
      
        
    
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        <script type="text/javascript" src="techfiles/dom.js"></script>

<form name='RegistrationForm' onsubmit="return checkform()" action='fircheck.jsp' >


		
		<table width='100%' align="center">
			<tr>
					<td colspan='4' align='center'><h1>FIRST INFORMATION REPORT</h1></td>
					
				</tr>
			
				<tr><td colspan='4' align='center'>( under section 154 Cr.P.C)</td></tr>
				<tr>
					
		<td>Date of Occurrence:<span class='style3'>*</span></td>

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
			</select> <span id='dateselDIV'>
					<select name='date'>
					<option>dd</option>
					</select> </span> 
		</td>
		<td>Time of occurrence:<span class='style3'>*</span></td>
					<td ><input type="text" name="time_occurance" id="time_occurance" /> <div id="time2_picker" class="time_picker_div"></div>	</td>
		</tr>
			
				<tr>
					<td style='width: 120px'>Date of reporting: <span class='style3'>*</span></td>
							<td><select name="year1" onchange="listdate(document.RegistrationForm.month.value,this.value)">
				<option value='0'>year</option>
				<%
			Date date1=new Date();


			//SimpleDateFormat simpleDateformat=new SimpleDateFormat("yyyy");
			int a1=Integer.parseInt(simpleDateformat.format(date1));
			for(int i=a1;i>=1948;--i)
			{
			%>
			<option value='<%=i %>'><%=i %></option>
			<%
			}
			
			 %>	
				</select>
				
				
			 <select name='month1' onchange='listdate1(this.value,document.RegistrationForm.year1.value)'>
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
			</select> <span id='datesel1DIV'>
					<select name='date1'>
					<option>dd</option>
					</select> </span> 
		</td>
					<td>Time of reporting:<span class='style3'>*</span></td>
					<td><input type='text' name='time_report' maxlength='5' size="14" /> Eg :22:13<!-- current time --></td>
				</tr>
				

	<tr>
		<td style='text-align: top'>Place of occurrence details:<span class='style3'>*</span></td>
		<td colspan='2'><textarea name='occu_place' title='Please enter the place of occurance' cols='46' rows='5' ></textarea></td>
	</tr>
	<tr>
	<td>Particulars of the properties stolen:<span class='style3'>*</span></td>
	<td colspan='2'><textarea name='particulars' title='Please enter the particulars of stolen property' cols='46' rows='5'></textarea></td>
	</tr>
	<tr>
	<td>Total value of the properties stolen:</td>
	<td colspan='2'><input type='text' name='totalvalue' maxlength='10' title='Please enter the particulars of stolen property' /></td>
	</tr>
	

	<tr class='colour'>
		<td colspan='4'><b>Complainant Information</b></td>
	</tr>
	<tr>
		<td style='width: 120px'>Name: <span class='style3'>*</span></td>
		<td><input type='text' name='name' maxlength='50'			title='Please enter the complainant s name'/></td>

		<td>Son/Daughter/Husband of :<span class='style3'>*</span></td>
		<td><input type='text' name='sdhname' maxlength='50' title='Please enter the complainant s name' /></td>
	</tr>
	<tr>
		<td>Nationality:<span class='style3'>*</span></td>
		 <td><input type='text' name='nationality' maxlength='30' /> 
      
	</td>
	<td>Occupation:<span class='style3'>*</span></td>
		<td>
			<input type='text' name='occupation' maxlength='150'/>
		</td>
		 
	</tr>
	<tr>
		<td valign='top'>Complaint</td>
		<td colspan="3"><textarea name='complaint' cols='46' rows='5' ><%=request.getParameter("complaint") %></textarea>
		<input type='hidden' name='id' value='<%=request.getParameter("id") %>'/>
		</td>
	</tr>
		<tr>
		<td valign='top' colspan="4"><strong>Suspect Information (if known)</strong></td>
		
	</tr>
	<tr>
		<td valign='top'>First Suspect Name</td>
		<td ><input type='text' name='first' /></td>
	</tr>
	<tr>
		<td valign='top'>Second Suspect Name</td>
		<td ><input type='text' name='second' /></td>
	</tr>
	<tr>
		<td>FIR Summary:<span class='style3'>*</span></td>
		<td colspan='2'><textarea name='firsummary' title='Please enter the summary of FIR' cols='46' rows='5'></textarea></td>	
	</tr>
	

</table>
<table width='100%'  cellspacing='5' cellpadding='5'  style='text-align:center;vertical-align: top'>
	<tr>
		<td width='25%'>&nbsp;</td>
		<td><input id='submit' type='submit' value='Submit'/></td>
		<td><input type='reset' value='Reset'/></td>
		<td width='25%'>&nbsp;</td>
		
	</tr>
	</table>
	</form>
		<!-- end  listall -->
	
<jsp:include page='foot.jsp' flush="false"></jsp:include> 
</body>
</html>
