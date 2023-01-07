<DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<%@page language="java" import="java.util.Date" %>
 <%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
  <%@page import="java.util.Date" %>
  <%@page language="java" import="java.io.*, javax.swing.*, java.awt.*,
java.sql.*, java.util.*, net.sf.jasperreports.engine.*,
net.sf.jasperreports.view.*;" %>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="techfiles/othervalids.js"></script>
<link href="css/dropdown-menu.css" rel="stylesheet" type="text/css" />
<jsp:useBean id="db" class="database.dncon" />
<title>Complaints| LAW &amp; ORDER</title>
</head>

<body>
<script  type="text/javascript" language="javascript" >
function changecolor(a)
{
//alert("hi");
	
	 if(a==1)
		{
		
		
		//AJAX starts here
		// It will continue and won't end
		document.getElementById("listall").innerHTML="";
		citizensignup(1)
		}
		if(a==2)
		{
		
		
		//AJAX starts here
		// It will continue and won't end
		document.getElementById("listall").innerHTML="";
		detectivesignup(1)
		}
		if(a==3)
		{
		
		
		//AJAX starts here
		// It will continue and won't end
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
	
	var elem = document.getElementById(a);
	 elem.style.background = "#f3f3f3";
	
	 




}
</script>
      
        <script type="text/javascript" src="techfiles/othervalids.js"></script>
    <jsp:include page='head.jsp' flush="false"></jsp:include>
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
       

<%
try
{
String date=request.getParameter("date");
String month=request.getParameter("month");
String year=request.getParameter("year");
String occ=request.getParameter("time_occurence");

String date1=request.getParameter("date1");
String month1=request.getParameter("month1");
String year1=request.getParameter("year1");
String rep=request.getParameter("time_report");

String place=request.getParameter("occu_place");
String parti=request.getParameter("particulars");
String value=request.getParameter("totalvalue");

String name=request.getParameter("name");
String sdhname=request.getParameter("sdhname");
String nationality=request.getParameter("nationality");
String occupation=request.getParameter("occupation");
String summary=request.getParameter("firsummary");
String first=request.getParameter("first");
String second=request.getParameter("second");

String[] monthName = {"zero","January", "February",
            "March", "April", "May", "June", "July",
            "August", "September", "October", "November",
            "December"};
 
        
        String monthname = monthName[Integer.parseInt(month)];
        String monthname1 = monthName[Integer.parseInt(month1)];
String fir="<fir>"
+"<date>"+monthname+"/"+date+"/"+year+"</date>"
+"<occurence>"+occ+"</occurence>"
+"<date1>"+monthname1+"/"+date1+"/"+year1+"</date1>"
+"<timereport>"+rep+"</timereport>"
+"<place>"+place+"</place>"
+"<parti>"+parti+"</parti>"
+"<totalvalue>"+value+"</totalvalue>"
+"<name>"+name+"</name>"
+"<sdhname>"+sdhname+"</sdhname>"
+"<nationality>"+nationality+"</nationality>"
+"<first>"+first+"</first>"
+"<second>"+second+"</second>"
+"<occupation>"+occupation+"</occupation>"
+"<summary>"+summary+"</summary>"
+"</fir>";
db.connect();
String complaint =request.getParameter("complaint");
String complaint_id =request.getParameter("id");
ResultSet rs=null;
rs=db.execSQL("select max(id) as id,(select policestation from sakansha.policejob where p_ip="+session.getAttribute("id")+") from sakansha.fir_details");
		while(rs.next())
		{
		
	
			
			Calendar cal = Calendar.getInstance(); 
			int current = cal.get(Calendar.YEAR);
			
			
			DecimalFormat myFormat1 = new java.text.DecimalFormat("0000");
			String ps1=myFormat1.format(Integer.parseInt(rs.getString("policestation")));
			
			int co=Integer.parseInt(rs.getString("id"))+1;
			DecimalFormat myFormat = new java.text.DecimalFormat("000000");
			String firno1=myFormat.format(co);
			
			String a="F"+current+ps1+firno1;
			
		db.updateSQL("insert into sakansha.cases(id,fir,crimedetail) values ((select max(id)+1 from sakansha.cases),"+co+",0)");
		String query="insert into sakansha.fir_details(id,details,by,on,complaint,complaint_id,policestation,fir) values((select max(id)+1 from sakansha.fir_details),'"+fir+"',"+session.getAttribute("id")+",current_timestamp,'"+complaint+"',"+complaint_id+","+rs.getString("policestation")+",'"+a+"')";
		db.updateSQL(query);
		
		if(!(complaint_id==null||complaint_id.equals("")))
		{
		String query1="update sakansha.complaints set status=6 where comp_id="+complaint_id;
		db.updateSQL(query1);
		}
		out.print("<table align=center><tr><td><h1><font color=green>FIR number is "+a+"</font></h1></td></tr></table>");
		
		}
		db.close();
		

}
catch(Exception e)
{
out.print("Error"+e.getMessage());

}

%>
<h3> <font color=red><span>FIR is Made. And you cannot edit the FIR here after.</span></font></h3> To add other forms to this case <a href="files.jsp">click here</a>

<jsp:include page='foot.jsp' flush="false"></jsp:include>

</body>
</html>