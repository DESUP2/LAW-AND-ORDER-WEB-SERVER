<DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<%@page language="java" import="java.util.Date" %>
 <%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
  <%@page import="java.util.Date" %>
<head>
<%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
      <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
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
       
        					
<%
try
{
db.connect();
					String desc="";	 
	 String id="";
	 String itemName="";
	 String file="";
	 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			 if (!isMultipart) {
								 } else {
								 
										   FileItemFactory factory = new DiskFileItemFactory();
										   ServletFileUpload upload = new ServletFileUpload(factory);
										   List items = null;
										   try 
										   {
										   items = upload.parseRequest(request);
										  }
											catch (FileUploadException e) 
											{
											 e.printStackTrace();
											 
										   }
										   Iterator itr = items.iterator();
										   
										   while (itr.hasNext()) 	
										   {
											   FileItem item = (FileItem) itr.next();
											   if (item.isFormField())
											   {
												      String name = item.getFieldName();
													  String value = item.getString();
													  if(name.equals("desc"))
											           {
																   desc=value;
												            
													   }
													  if(name.equals("id"))
									                  {  
													         id=value;            		 
									                     
													  }
													   if(name.equals("file"))
									                  {  
													         file=value;            		 
									                     
													  }
													  
												}													  		 		 		    
   									  			 else
	   											{
												    try {
														 itemName = item.getName();
												
															
															   File savedFile = new File(config.getServletContext().getRealPath("/")+"\\upload\\casefiles\\"+itemName);
															   item.write(savedFile);
															  
														    
												   		} 
												   	catch (Exception e) {
												   			out.println("Error"+e.getMessage());
												   		}
											   }
				   }
		try{
													   String query="insert into sakansha.upload(id,location,desc,time,by,case) values((select max(id)+1 from sakansha.upload),'"+itemName+"','"+desc+"',current_timestamp,"+session.getAttribute("id")+","+id+")";
													   db.updateSQL(query);
%>													   <table align="center"><tr><td><h2><font color=green>Your Files were uploaded</font></h2></td></tr><tr><td><font color=green> <span><a onclick="javascript:window.location='att.jsp?id=<%=id %>'" style="cursor:pointer">To attach another file click here</a></span></font><td></tr></table><%
			}%><%
												  catch(Exception e1)
												   {
												   	out.println("Error 1"+e1.getMessage());
												   }
									
	   
	  }
	db.close();
}
catch(Exception e)
{
out.print("Error"+e.getMessage());

}

 %>
<jsp:include page='foot.jsp' flush="false"></jsp:include>
</body>
</html>