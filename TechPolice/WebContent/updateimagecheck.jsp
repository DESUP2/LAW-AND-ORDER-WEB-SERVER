<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page language="java" import="java.sql.*,java.util.*" %>
<jsp:useBean id="db" class="database.dncon" />
<jsp:useBean id="mail" class="database.mail"/>
<%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
    <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
<html>
<head>
<title>updateimagecheck</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
 <%
  
try
{
String ImageFile="";
String itemName = "";
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if (!isMultipart)
{
}
else
{
FileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);
List items = null;
try
{
items = upload.parseRequest(request);
}
catch (FileUploadException e)
{
e.getMessage();
}

Iterator itr = items.iterator();
while (itr.hasNext())
{
FileItem item = (FileItem) itr.next();
if (item.isFormField())
{
String name = item.getFieldName();
String value = item.getString();
if(name.equals("ImageFile"))
{
ImageFile=value;
}

}
else
{
try
{
itemName = item.getName();
												
															// itemName = item.getName();
															   File savedFile = new File(config.getServletContext().getRealPath("/")+"\\upload\\"+itemName);
															   
															   item.write(savedFile);
														    
												   		} 
												   	catch (Exception e) {
												   			out.println("Error"+e.getMessage());
												   		}
											   }
	   }
	   
	  try
	{out.println("Enter correct GAS ID");
		Class.forName("com.ibm.db2.jcc.DB2Driver");
		Connection con = DriverManager.getConnection("jdbc:db2:LAW");
		//String name,password,date,month,year,date1,month1,year1, district,taluk,email,phoneno,education,telephoneno,mobileno,pincode,addressLine1,addressLine2,query;
	
		Statement st=con.createStatement();
		Statement st1=con.createStatement();
		//String query= "select * from SAKANSHA.SIGNUPUSER";
		String query="UPDATE  SAKANSHA.SIGNIN SET  IMAGE='"+itemName+"' where ID='"+session.getAttribute("id")+"'";
		
		
		//ResultSet rs=st.executeQuery(query);
		//while(rs.next())
		//{if (OPASSWORD.equals((String)rs.getString("PASSWORD"))){
		//if (OPASSWORD.equals((String)rs.getString("PASSWORD")))
	//	{
		//query="UPDATE  SAKANSHA.SIGNUPUSER SET  PASSWORD='"+NPASSWORD+"'";
		//out.println("hiiii  "+st.executeUpdate(query));
		if(st.executeUpdate(query)==1)
		{
		%><jsp:forward	page="suc.jsp"><jsp:param name="err1" value="Your image was successfuly uploaded." /></jsp:forward><%
		//}
		}
		else
		{
		%><jsp:forward	page="suc.jsp"><jsp:param name="err" value="OOPS! Something went wrong please try again." /></jsp:forward><%
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
 




	  }
	   
  }
  catch(Exception e)
  {
  	out.println(e);
  }
   %><%%>
 <%db.close(); %>

</body>
</html>