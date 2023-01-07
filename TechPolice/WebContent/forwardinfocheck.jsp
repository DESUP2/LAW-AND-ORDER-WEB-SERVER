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
out.print("hi");
					String state=request.getParameter("state");	 
	 String dis=request.getParameter("dis");	;
	 String ps=request.getParameter("ps");	;
		String detail=request.getParameter("detail");	;
		
		
		String file=request.getParameter("file");	;
		String itemName="";out.print("hi");
		
	 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			 if (!isMultipart) {
								 } else {
								 out.print("hi");
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
													  out.print("hi");
													 												}													  		 		 		    
   									  			 else
	   											{
												    try {out.print("hi");
														 itemName = item.getName();
												
															// itemName = item.getName();
															   File savedFile = new File(config.getServletContext().getRealPath("/")+"\\upload\\casefiles\\"+itemName);
															   item.write(savedFile);
															  // out.print(config.getServletContext().getRealPath("/"));
														    
												   		} 
												   	catch (Exception e) {
												   			out.println("Error"+e.getMessage());
												   		}
											   }
				   }%><jsp:forward	page="suc.jsp"><jsp:param name="err1" value="Your Information Was Forwarded." /></jsp:forward><%
		try{
			ResultSet rs=null;
		out.print("di");
		rs=db.execSQL("select i.id,i.zone,i.city,i.police_station from sakansha.police_duty as i where id="+request.getParameter("id"));out.print("hi");
		String query="insert into sakansha.forwardinfo(id,tostate,on,tops,details,files,fromid,fromps,fromarea) values((select max(id)+1 from sakansha.forwardinfo),'"+state+"','"+dis+"',current_timestamp,"+ps+","+detail+",'"+itemName+"',"+session.getAttribute("id")+",'"+rs.getString("police_station")+"','"+rs.getString("city")+"')";
	out.print("ffi");	db.updateSQL(query);
%>													    <span><h2><font color=green>Your Information Was Forwarded.</font></h2><br/><a onclick="javascript:window.location='forwardinfo.jsp'" style="cursor:pointer">To add another criminal record click here</a></span><%
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
				</td></tr></table>	
					<jsp:include page='foot.jsp' flush="false"></jsp:include>

</body>
</html>