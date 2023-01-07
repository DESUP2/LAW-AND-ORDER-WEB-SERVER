<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page language="java" import="java.sql.*" %>
<%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
<%@page import="java.util.Date" %>
<html>
<head>
<title>updatepasswordcheck</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
 <% 
	try
	{
		Class.forName("com.ibm.db2.jcc.DB2Driver");
		Connection con = DriverManager.getConnection("jdbc:db2:LAW");
		//String name,password,date,month,year,date1,month1,year1, district,taluk,email,phoneno,education,telephoneno,mobileno,pincode,addressLine1,addressLine2,query;
		String OPASSWORD=request.getParameter("pass1");
		String NPASSWORD=request.getParameter("pass2");
		
		//String CPASSWORD = request.getParameter("CPASSWORD");
		//String GASID=request.getParameter("GASID");
		//out.println(GASID);
		Statement st=con.createStatement();
		//String query= "select * from SAKANSHA.SIGNUPUSER";
		String query="UPDATE  SAKANSHA.SIGNIN SET  PASSWORD='"+NPASSWORD+"' where ID='"+session.getAttribute("id")+"' AND PASSWORD='"+OPASSWORD+"'";
		//ResultSet rs=st.executeQuery(query);
		//while(rs.next())
		//{if (OPASSWORD.equals((String)rs.getString("PASSWORD"))){
		//if (OPASSWORD.equals((String)rs.getString("PASSWORD")))
	//	{
		//query="UPDATE  SAKANSHA.SIGNUPUSER SET  PASSWORD='"+NPASSWORD+"'";
		//out.println("hiiii  "+st.executeUpdate(query));
		if(st.executeUpdate(query)==1)
		{
		%><jsp:forward	page="suc.jsp"><jsp:param name="err1" value="Password Was Changed Successfylly." /></jsp:forward><%
		//}
		}
		else
		{
		%><jsp:forward	page="err.jsp"><jsp:param name="err1" value="You entered a invalid password." /></jsp:forward><%
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