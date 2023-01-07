<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page language="java" import="java.sql.*" %>
	<jsp:useBean id="mail" class="database.mail" />
<%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
<%@page import="java.util.Date" %>
<html>
<head>
<title>updateprofile</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<jsp:include page='head.jsp' flush="false"></jsp:include>
      
        
    
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        
        <% 
	try
	{
		Class.forName("com.ibm.db2.jcc.DB2Driver");
		Connection con = DriverManager.getConnection("jdbc:db2:LAW");
		//String name,password,date,month,year,date1,month1,year1, district,taluk,email,phoneno,education,telephoneno,mobileno,pincode,addressLine1,addressLine2,query;
		String USERNAME=request.getParameter("email");
		String profession=request.getParameter("profession");
		
		String marry = request.getParameter("maritialstatus");
		String phone=request.getParameter("phoneno");
		String mobile=request.getParameter("mobileno");
		String add=request.getParameter("addressline1")+request.getParameter("addressline2");
		//String pin=request.getParameter("pincode");
		String area= request.getParameter("area");
		String blood=request.getParameter("bg");
		Statement st=con.createStatement();
		Statement st1=con.createStatement();
		//String query= "select * from SAKANSHA.SIGNUPUSER";
		String query="UPDATE  SAKANSHA.SIGNIN SET  USERNAME='"+USERNAME+"' where ID='"+session.getAttribute("id")+"'";
		String query1="UPDATE  SAKANSHA.SUBJECT SET  AREA='"+area+"',profession='"+profession+"',phonenumber='"+phone+"',mobile='"+mobile+"',address='"+add+"',bloodgroup='"+blood+"' where SUBJECT_ID='"+session.getAttribute("id")+"'";
		
		st1.executeUpdate(query1);
		//ResultSet rs=st.executeQuery(query);
		//while(rs.next())
		//{if (OPASSWORD.equals((String)rs.getString("PASSWORD"))){
		//if (OPASSWORD.equals((String)rs.getString("PASSWORD")))
	//	{
		//query="UPDATE  SAKANSHA.SIGNUPUSER SET  PASSWORD='"+NPASSWORD+"'";
		//out.println("hiiii  "+st.executeUpdate(query));
		if(st.executeUpdate(query)==1)
		{
		%><%String  subject="Update in your LAW & ORDER profile";
												String message="  "
										     	+"You have recently updated your profile "
										     	+"     and your id is changed to ."
										      	+"  "
										      	+""
										     	+": "+USERNAME+" "
										      	+"  Now you will get all alerts on this id." +"    Also pplease login from this id only.Previous id would be invalid."   	      	
										      	+"If you want to update your id, then go to ur update profile to make changes.";
												mail.GmailSend(USERNAME,subject,message); %><jsp:forward	page="suc.jsp"><jsp:param name="err1" value="Profle Update Was Successfull." /></jsp:forward><%
		//}
		}
		else
		{
		%><jsp:forward	page="err.jsp"><jsp:param name="err1" value="OOPS! Something went wrong please try again." /></jsp:forward><%
		}
		
		//}
		//else{out.println("Enter correct GAS ID");}
		
		
	 
	
	
											   
											   
		//}
		con.close();
	}
	catch(Exception e)
	{
		out.println("Error"+e.getMessage());
		
	}
	%>

</body>
</html>