// Use Of Ajax

function validateusername(str)

  { 

  xmlHttp=CreateXmlHttpObject()

  if (xmlHttp==null)

  {

  alert ("Browser does not support HTTP Request")

  return

  } 

  var url="validemail.jsp"

  url=url+"?qparam="+str

  url=url+"&sid="+Math.random()

  xmlHttp.onreadystatechange=stateChanged 

  xmlHttp.open("GET",url,true)

  xmlHttp.send(null)

  }

function stateChanged() 

  { 

  	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  	{	 

  		document.getElementById("usernameDIV").innerHTML=xmlHttp.responseText 

  	} 

  } 
  

function stateChanged1() 

  { 

  if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  { 

  document.getElementById("taluklistDIV").innerHTML=xmlHttp.responseText 

  } 

  } 

function CreateXmlHttpObject()

  { 

  var objXMLHttp=null

  if (window.XMLHttpRequest)

  {

  objXMLHttp=new XMLHttpRequest()

  }

  else if (window.ActiveXObject)

  {

  objXMLHttp=new ActiveXObject("Microsoft.XMLHTTP")

  }

  return objXMLHttp

  }
  function listdate(mon,year)
{
	var a=year%4;	

	if(mon==04||mon==06||mon==09|mon==11)
	{
	var output="<select name='date'><OPTION value='00'>dd</OPTION><OPTION value='01'>01</OPTION><OPTION value='02'>02</OPTION><OPTION value='03'>03</OPTION><OPTION value='04'>04</OPTION><OPTION value='05'>05</OPTION><OPTION value='06'>06</OPTION><OPTION value='07'>07</OPTION><OPTION value='08'>08</OPTION><OPTION value='09'>09</OPTION><OPTION value='10'>10</OPTION><OPTION value='11>11</OPTION><OPTION value='12'>12</OPTION><OPTION value='13'>13</OPTION><OPTION value='14'>14</OPTION><OPTION value='15'>15</OPTION><OPTION value='16'>16</OPTION><OPTION value='17'>17</OPTION><OPTION value='18'>18</OPTION><OPTION value='19'>19</OPTION><OPTION value='20'>20</OPTION><OPTION value='21'>21</OPTION><OPTION value='22'>22</OPTION><OPTION value='23'>23</OPTION><OPTION value='24'>24</OPTION><OPTION value='25'>25</OPTION><OPTION value='26'>26</OPTION><OPTION value='27'>27</OPTION><OPTION value='28'>28</OPTION><OPTION value='29'>29</OPTION><OPTION value='30'>30</OPTION></SELECT>"

	document.getElementById("dateselDIV").innerHTML=output;
	}
	if(mon==02)
	{
		if(a==0){
		var output="<select name='date'><OPTION value='0'>dd</OPTION><OPTION value='1'>01</OPTION><OPTION value='2'>02</OPTION><OPTION value='3'>03</OPTION><OPTION value='4'>04</OPTION><OPTION value='5'>05</OPTION><OPTION value='6'>06</OPTION><OPTION value='7'>07</OPTION><OPTION value='8'>08</OPTION><OPTION value='9'>09</OPTION><OPTION value='10'>10</OPTION><OPTION value='11>11</OPTION><OPTION value='12'>12</OPTION><OPTION value='13'>13</OPTION><OPTION value='14'>14</OPTION><OPTION value='15'>15</OPTION><OPTION value='16'>16</OPTION><OPTION value='17'>17</OPTION><OPTION value='18'>18</OPTION><OPTION value='19'>19</OPTION><OPTION value='20'>20</OPTION><OPTION value='21'>21</OPTION><OPTION value='22'>22</OPTION><OPTION value='23'>23</OPTION><OPTION value='24'>24</OPTION><OPTION value='25'>25</OPTION><OPTION value='26'>26</OPTION><OPTION value='27'>27</OPTION><OPTION value='28'>28</OPTION><OPTION value='29'>29</OPTION></SELECT>"

	document.getElementById("dateselDIV").innerHTML=output;

		}
		else
		{
		var output="<select name='date'><OPTION value='0'>dd</OPTION><OPTION value='1'>01</OPTION><OPTION value='2'>02</OPTION><OPTION value='3'>03</OPTION><OPTION value='4'>04</OPTION><OPTION value='5'>05</OPTION><OPTION value='6'>06</OPTION><OPTION value='7'>07</OPTION><OPTION value='8'>08</OPTION><OPTION value='9'>09</OPTION><OPTION value='10'>10</OPTION><OPTION value='11>11</OPTION><OPTION value='12'>12</OPTION><OPTION value='13'>13</OPTION><OPTION value='14'>14</OPTION><OPTION value='15'>15</OPTION><OPTION value='16'>16</OPTION><OPTION value='17'>17</OPTION><OPTION value='18'>18</OPTION><OPTION value='19'>19</OPTION><OPTION value='20'>20</OPTION><OPTION value='21'>21</OPTION><OPTION value='22'>22</OPTION><OPTION value='23'>23</OPTION><OPTION value='24'>24</OPTION><OPTION value='25'>25</OPTION><OPTION value='26'>26</OPTION><OPTION value='27'>27</OPTION><OPTION value='28'>28</OPTION></SELECT>"

	document.getElementById("dateselDIV").innerHTML=output;

		}
		
	}
	if(mon==01||mon==03||mon==05||mon==07||mon==08|mon==10||mon==12)
	{

var output="<select name='date'><OPTION value='0'>dd</OPTION><OPTION value='1'>01</OPTION><OPTION value='2'>02</OPTION><OPTION value='3'>03</OPTION><OPTION value='4'>04</OPTION><OPTION value='5'>05</OPTION><OPTION value='6'>06</OPTION><OPTION value='7'>07</OPTION><OPTION value='8'>08</OPTION><OPTION value='9'>09</OPTION><OPTION value='10'>10</OPTION><OPTION value='11>11</OPTION><OPTION value='12'>12</OPTION><OPTION value='13'>13</OPTION><OPTION value='14'>14</OPTION><OPTION value='15'>15</OPTION><OPTION value='16'>16</OPTION><OPTION value='17'>17</OPTION><OPTION value='18'>18</OPTION><OPTION value='19'>19</OPTION><OPTION value='20'>20</OPTION><OPTION value='21'>21</OPTION><OPTION value='22'>22</OPTION><OPTION value='23'>23</OPTION><OPTION value='24'>24</OPTION><OPTION value='25'>25</OPTION><OPTION value='26'>26</OPTION><OPTION value='27'>27</OPTION><OPTION value='28'>28</OPTION><OPTION value='29'>29</OPTION><OPTION value='30'>30</OPTION><option value='31'>31</option></SELECT>"
	document.getElementById("dateselDIV").innerHTML=output;
	}
}
function listdate1(mon,year)
{
	var a=year%4;	

	if(mon==04||mon==06||mon==09|mon==11)
	{
	var output="<select name='date1'><OPTION value='0'>dd</OPTION><OPTION value='1'>01</OPTION><OPTION value='2'>02</OPTION><OPTION value='3'>03</OPTION><OPTION value='4'>04</OPTION><OPTION value='5'>05</OPTION><OPTION value='6'>06</OPTION><OPTION value='7'>07</OPTION><OPTION value='8'>08</OPTION><OPTION value='9'>09</OPTION><OPTION value='10'>10</OPTION><OPTION value='11'>11</OPTION><OPTION value='12'>12</OPTION><OPTION value='13'>13</OPTION><OPTION value='14'>14</OPTION><OPTION value='15'>15</OPTION><OPTION value='16'>16</OPTION><OPTION value='17'>17</OPTION><OPTION value='18'>18</OPTION><OPTION value='19'>19</OPTION><OPTION value='20'>20</OPTION><OPTION value='21'>21</OPTION><OPTION value='22'>22</OPTION><OPTION value='23'>23</OPTION><OPTION value='24'>24</OPTION><OPTION value='25'>25</OPTION><OPTION value='26'>26</OPTION><OPTION value='27'>27</OPTION><OPTION value='28'>28</OPTION><OPTION value='29'>29</OPTION><OPTION value='30'>30</OPTION></SELECT>"

	document.getElementById("datesel1DIV").innerHTML=output;
	}
	if(mon==02)
	{
		if(a==0){
		var output="<select name='date1'><OPTION value='0'>dd</OPTION><OPTION value='1'>01</OPTION><OPTION value='2'>02</OPTION><OPTION value='3'>03</OPTION><OPTION value='4'>04</OPTION><OPTION value='5'>05</OPTION><OPTION value='6'>06</OPTION><OPTION value='7'>07</OPTION><OPTION value='8'>08</OPTION><OPTION value='9'>09</OPTION><OPTION value='10'>10</OPTION><OPTION value='11>11</OPTION><OPTION value='12'>12</OPTION><OPTION value='13'>13</OPTION><OPTION value='14'>14</OPTION><OPTION value='15'>15</OPTION><OPTION value='16'>16</OPTION><OPTION value='17'>17</OPTION><OPTION value='18'>18</OPTION><OPTION value='19'>19</OPTION><OPTION value='20'>20</OPTION><OPTION value='21'>21</OPTION><OPTION value='22'>22</OPTION><OPTION value='23'>23</OPTION><OPTION value='24'>24</OPTION><OPTION value='25'>25</OPTION><OPTION value='26'>26</OPTION><OPTION value='27'>27</OPTION><OPTION value='28'>28</OPTION><OPTION value='29'>29</OPTION></SELECT>"

	document.getElementById("datesel1DIV").innerHTML=output;

		}
		if(a>0)
		{
		var output="<select name='date1'><OPTION value='00'>dd</OPTION><OPTION value='1'>01</OPTION><OPTION value='2'>02</OPTION><OPTION value='3'>03</OPTION><OPTION value='4'>04</OPTION><OPTION value='5'>05</OPTION><OPTION value='6'>06</OPTION><OPTION value='7'>07</OPTION><OPTION value='8'>08</OPTION><OPTION value='9'>09</OPTION><OPTION value='10'>10</OPTION><OPTION value='11>11</OPTION><OPTION value='12'>12</OPTION><OPTION value='13'>13</OPTION><OPTION value='14'>14</OPTION><OPTION value='15'>15</OPTION><OPTION value='16'>16</OPTION><OPTION value='17'>17</OPTION><OPTION value='18'>18</OPTION><OPTION value='19'>19</OPTION><OPTION value='20'>20</OPTION><OPTION value='21'>21</OPTION><OPTION value='22'>22</OPTION><OPTION value='23'>23</OPTION><OPTION value='24'>24</OPTION><OPTION value='25'>25</OPTION><OPTION value='26'>26</OPTION><OPTION value='27'>27</OPTION><OPTION value='28'>28</OPTION></SELECT>"

	document.getElementById("datesel1DIV").innerHTML=output;

		}
		
	}
	if(mon==01||mon==03||mon==05||mon==07||mon==08|mon==10||mon==12)
	{

var output="<select name='date1'><OPTION value='0'>dd</OPTION><OPTION value='1'>01</OPTION><OPTION value='2'>02</OPTION><OPTION value='3'>03</OPTION><OPTION value='4'>04</OPTION><OPTION value='5'>05</OPTION><OPTION value='6'>06</OPTION><OPTION value='7'>07</OPTION><OPTION value='8'>08</OPTION><OPTION value='9'>09</OPTION><OPTION value='10'>10</OPTION><OPTION value='11>11</OPTION><OPTION value='12'>12</OPTION><OPTION value='13'>13</OPTION><OPTION value='14'>14</OPTION><OPTION value='15'>15</OPTION><OPTION value='16'>16</OPTION><OPTION value='17'>17</OPTION><OPTION value='18'>18</OPTION><OPTION value='19'>19</OPTION><OPTION value='20'>20</OPTION><OPTION value='21'>21</OPTION><OPTION value='22'>22</OPTION><OPTION value='23'>23</OPTION><OPTION value='24'>24</OPTION><OPTION value='25'>25</OPTION><OPTION value='26'>26</OPTION><OPTION value='27'>27</OPTION><OPTION value='28'>28</OPTION><OPTION value='29'>29</OPTION><OPTION value='30'>30</OPTION><option value='31'>31</option></SELECT>"
	document.getElementById("datesel1DIV").innerHTML=output;
	}
}
  function listemployee(optionsel)
{
	if(optionsel==1)
	{
	var output="<select name='designation' onchange='listemployee1(this.value)'><option value='0'>Select</option><option value='1'>Collector</option><option value='4'>Thasildhar</option><option value='2'>Deputry-Thasildhar</option><option value='3'>R.I</option><option value='5'>V.A.O</option></select>"
	document.getElementById("designationDIV").innerHTML=output;
	
	}
	if(optionsel==2)
	{
	var output="<select name='designation' onchange='listemployee1(this.value)'><option value='0'>Select</option><option value='6'>Civil Supplies Thasildhar</option><option value='7'>Civil Supplies R.I</option></select>";
	document.getElementById("designationDIV").innerHTML=output;
	}
}
function reason(optionsel)
{

	if(optionsel==1||optionsel==0||optionsel==2)
	{
	var ou="";
	document.getElementById("rDIV").innerHTML=ou;
	document.getElementById("reasonDIV").innerHTML=ou;
	return;
	}
	if(optionsel==3)
	{
	var output="Reason for rejecting";
	var output1="<input name='reason' type='text'   maxlength='300'>";	
	document.getElementById("rDIV").innerHTML=output;
	document.getElementById("reasonDIV").innerHTML=output1;
	return;
	}
	return;
}
function listemployee1(optionsel1)
{
	if(optionsel1==1)
	{
	var output="<select name='taluk'><option value='500'>Not Applicable</option></select>"
	document.getElementById("taluklistDIV").innerHTML=output;
	}
	else
	{
	taluklist(document.form1.district.value);
	}
}
  
function searchuser(str,name,db)

  { 
  //var	output="Searching";
 
document.getElementById("student_details").innerHTML="<strong>Searching...</strong>";
	
  xmlHttp=CreateXmlHttpObject()

  if (xmlHttp==null)

  {

  alert ("Browser does not support HTTP Request")

  return

  } 

  var url="searchcontent.jsp"

  url=url+"?qparam="+str+"&name="+name+"&db="+db

  url=url+"&sid="+Math.random()

  xmlHttp.onreadystatechange=stateChanged2 

  xmlHttp.open("GET",url,true)

  xmlHttp.send(null)

  }

function stateChanged2() 

  { 

  	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  	{	 

  		document.getElementById("student_details").innerHTML=xmlHttp.responseText 

  	} 

  } 
  function listcaste(str)

  { 

  xmlHttp=CreateXmlHttpObject()

  if (xmlHttp==null)

  {

  alert ("Browser does not support HTTP Request")

  return

  } 

  var url="listcaste.jsp"

  url=url+"?qparam="+str

  url=url+"&sid="+Math.random()

  xmlHttp.onreadystatechange=stateChanged3 

  xmlHttp.open("GET",url,true)

  xmlHttp.send(null)

  }

function stateChanged3() 

  { 

  	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  	{	 

  		document.getElementById("casteDIV").innerHTML=xmlHttp.responseText 

  	} 

  } 
  function city()

  { 

  xmlHttp=CreateXmlHttpObject()

  if (xmlHttp==null)

  {

  alert ("Browser does not support HTTP Request")

  return

  } 

  var url="loadcity.jsp"

  url=url+"?qparam=1"

  url=url+"&sid="+Math.random()

  xmlHttp.onreadystatechange=stateChanged4 

  xmlHttp.open("GET",url,true)

  xmlHttp.send(null)

  }

function stateChanged4() 

  { 

  	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  	{	 

  		document.getElementById("sel2").innerHTML=xmlHttp.responseText 

  	} 

  } 
  function CreateXmlHttpObject()

  { 

  var objXMLHttp=null

  if (window.XMLHttpRequest)

  {

  objXMLHttp=new XMLHttpRequest()

  }

  else if (window.ActiveXObject)

  {

  objXMLHttp=new ActiveXObject("Microsoft.XMLHTTP")

  }

  return objXMLHttp

  }
  function corz(str)
  {
 	 if(str==1)
	  {
	  city1();
	  
	  }
	 else
	 {
	 zone();
	 city();
	
	 }
	 return;
  }
 function loadarea(str)

  { 
 
//alert("hi");
  xmlHttp=CreateXmlHttpObject()

  if (xmlHttp==null)

  {

  alert ("Browser does not support HTTP Request")

  return

  } 

  var url="areaf.jsp"

  url=url+"?q="+str

  url=url+"&sid="+Math.random()
//alert(url);
  xmlHttp.onreadystatechange=stateChangedofficer5

  xmlHttp.open("GET",url,true)

  xmlHttp.send(null)

  }

function stateChangedofficer5() 

  { 
  

  if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  { 


  document.getElementById("arealistDIV").innerHTML=xmlHttp.responseText 



  } 

  } 
  function loadareas(str)

  { 
//alert(str);
  xmlHttp=CreateXmlHttpObject()

  if (xmlHttp==null)

  {

  alert ("Browser does not support HTTP Request")

  return

  } 

  var url="districts.jsp"

  url=url+"?dis="+str

  url=url+"&sid="+Math.random()

  xmlHttp.onreadystatechange=stateChangeda 

  xmlHttp.open("GET",url,true)

  xmlHttp.send(null)

  }

function stateChangeda() 

  { 

  	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  	{	 

  		document.getElementById("areaDIV").innerHTML=xmlHttp.responseText 

  	} 

  } 
  function answerpoll(str)

  { 
//alert(str);
document.getElementById("polls").innerHTML="<img src='images/general/loading.gif' height='150px' width='150px'>" 
  xmlHttp=CreateXmlHttpObject()

  if (xmlHttp==null)

  {

  alert ("Browser does not support HTTP Request")

  return

  } 

  var url="answerpoll.jsp"

  url=url+"?q="+str

  url=url+"&sid="+Math.random()

  xmlHttp.onreadystatechange=Changedx 

  xmlHttp.open("GET",url,true)

  xmlHttp.send(null)

  }

function Changedx() 

  { 

  	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  	{	 

  		document.getElementById("polls").innerHTML=xmlHttp.responseText 

  	} 

  } 