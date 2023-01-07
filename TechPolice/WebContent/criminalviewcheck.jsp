<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page language="java" import="java.sql.*" %>
<%@page language="java" import="java.util.Date" %>
<jsp:useBean id="db" class="database.dncon" />
 <%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
  <%@page import="java.util.Date" %>
  <%@page language="java" import="java.io.*, javax.swing.*, java.awt.*,
java.sql.*, java.util.*, net.sf.jasperreports.engine.*,net.sf.jasperreports.view.*" %>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
   <%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<html>
<head>
<title>Most Wanted Criminals |Law &amp; Order Automation</title>
</head>
<body>
<jsp:include page='head.jsp' flush="false"></jsp:include>
      
        
    
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        <script type="text/javascript" src="techfiles/dom.js"></script>
        <table width='100%' cellspacing='7' cellpadding="7"  >
				<tr>
					<td align='center'>
					
<%
try
{
db.connect();
String id1=request.getParameter("idd");
					String desc="";	 
	 String name1="";
	 String alias="";
		String sdhname="";
		String birth="";
		String height="";
		String weight="";
		String color="";
		String haircolor="";
		String id="";
		String date="";
		String month="";
		String year="";
		String file="";
		String itemName="";
		String most="";
		String last="";
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
													  if(name.equals("name1"))
											           {
																   name1=value;
												            
													   }
													   if(name.equals("alias"))
											           {
																   alias=value;
												            
													   }
													    if(name.equals("sdhname"))
											           {
																   sdhname=value;
												            
													   }
													    if(name.equals("birth"))
											           {
																   birth=value;
												            
													   }
													    if(name.equals("height"))
											           {
																   height=value;
												            
													   }
													    if(name.equals("weight"))
											           {
																   weight=value;
												            
													   }
													   if(name.equals("color"))
											           {
																   color=value;
												            
													   }
													   if(name.equals("haircolor"))
											           {
																   haircolor=value;
												            
													   }
													  if(name.equals("id"))
									                  {  
													         id=value;            		 
									                     
													  }
													  if(name.equals("date"))
									                  {  
													         date=value;            		 
									                     
													  }
													  if(name.equals("month"))
									                  {  
													         month=value;            		 
									                     
													  }
													  if(name.equals("year"))
									                  {  
													         year=value;            		 
									                     
													  }
													   if(name.equals("file"))
									                  {  
													         file=value;            		 
									                     
													  }
													    if(name.equals("most"))
									                  {  
													         most=value;            		 
									                     
													  }
													   if(name.equals("last"))
									                  {  
													         last=value;            		 
									                     
													  }
												}													  		 		 		    
   									  			 else
	   											{
												    try {
														 itemName = item.getName();
												
															// itemName = item.getName();
															   File savedFile = new File(config.getServletContext().getRealPath("/")+"\\upload\\criminal\\"+itemName);
															   item.write(savedFile);
															  // out.print(config.getServletContext().getRealPath("/"));
														    
												   		} 
												   	catch (Exception e) {
												   			out.println("Error"+e.getMessage());
												   		}
											   }
				   }
		try{
			String[] monthName = {"zero","January", "February",
					            "March", "April", "May", "June", "July",
					            "August", "September", "October", "November",
					            "December"};
					 
					        
					String monthname = monthName[Integer.parseInt(month)];
					
		String criminal="<criminal>"
		+"<name1>"+name1+"</name1>"
		+"<alias>"+alias+"</alias>"
		+"<date>"+monthname+"/"+date+"/"+year+"</date>"
		+"<sdhname>"+sdhname+"</sdhname>"
		+"<birth>"+birth+"</birth>"
		+"<height>"+height+"</height>"
		+"<weight>"+weight+"</weight>"
		+"<color>"+color+"</color>"
		+"<haircolor>"+haircolor+"</haircolor>"
		+"<last>"+last+"</last>"
		+"<id>"+id+"</id>"
		+"</criminal>";
		
													   String query="update sakansha.criminal set file='"+itemName+"',details='"+criminal+"',wanted="+most+" where id="+id+"";
													   db.updateSQL(query);
%>													    <span><h2><font color=green>Profile Was Updates Successfully.</font></h2><br/><a onclick="javascript:window.location='addcriminal.jsp'" style="cursor:pointer">To add another criminal record click here</a></span><%
			}
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


<br/></td></tr></table>
        
        <jsp:include page='foot.jsp' flush="false"></jsp:include>

</body>
</html>