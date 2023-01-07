function validateIntField(theField,paraName,isMandatory,minValue,maxValue,minDigitCount,maxDigitCount)
{	
	var ErrMsg ="";
	trimField(theField);
	var fieldValue = theField.value;
	if(fieldValue=="" && isMandatory)
	{
		ErrMsg = "Enter " + paraName + ".\n"
	}
	else if(fieldValue=="")
	{
		ErrMsg = "";
	}
	else if(isNaN(fieldValue)) 
	{			
		ErrMsg = "The " + paraName + " you entered should be a numeric value.\n";	
	}		
	else if(fieldValue.indexOf(".") != -1)
	{	
		ErrMsg = "Entered value for " + paraName + " should not be a decimal value.\n";			
	}
	else if(GetInt(fieldValue) < 0)
	{
		ErrMsg = "Entered value for "+ paraName + "  should be a positive value.\n";
	} 
	else if(minDigitCount != "" && !isNaN(minDigitCount) && fieldValue.length < minDigitCount)
	{
		ErrMsg = "The "+ paraName +" you enter should be a minimum of "+minDigitCount+" digits.";
	}
	else if(maxDigitCount != "" && !isNaN(maxDigitCount) && fieldValue.length > maxDigitCount)
	{
		ErrMsg = "The "+ paraName +" you entered should be less than or equal to "+maxDigitCount+" digits.";
	}	
	else if( minValue != "" && !isNaN(minValue) && GetInt(fieldValue) < minValue )
	{
		ErrMsg = "The " + paraName + " you entered should be greater than or equal to "+minValue+".";
	}	
	else if( maxValue != "" && !isNaN(maxValue) && GetInt(fieldValue) > maxValue )
	{
		ErrMsg = "The " + paraName + " you entered should be less than or equal to "+maxValue+".";
	}   
	return ErrMsg;
}


function validateField(theField,checkType,minLimit,maxLimit,paraName,splCharString) 
{
   
	var ErrMsg="";	
	trimField(theField);
	var fieldValue = theField.value;
	//validation for not to be null
	if(fieldValue=="")
	{
	 	state=false;	
		ErrMsg = "Enter "+paraName+".\n";
		return ErrMsg;
	}
	
	
	//check for the type of value in the field
	if(checkType == "INT") 
	{
		if(isNaN(fieldValue)) 
		{			
			ErrMsg = "Entered data in " + paraName + " field is not a numeric value.\n";		
		}
		
		if(fieldValue.indexOf(".") != -1)
		{	
			ErrMsg = "Entered data for " + paraName + " should not be a decimal value.\n";			
		}
		
		if(GetInt(fieldValue) <= 0)
		{
			ErrMsg = paraName + " should be greater than 0";
		}		
	}
	
	else if(checkType == "STRING")
	{
		//alert("enter the int zone ");
	}
	else if((checkType == "STRING-ONLY") && (!isNaN(fieldValue)) )
	{
		ErrMsg = paraName + " should not be a number.";
	}
	else if(checkType == "NAME")
	{
		if(!isNaN(fieldValue))
		{
			ErrMsg = paraName + " should not be a number.";
		}
		else
		{
			var firstchar = fieldValue.substring(0,1);
			if(!((firstchar >= 'a' && firstchar <= 'z') || (firstchar >= 'A' && firstchar <= 'Z')))
			{
				ErrMsg="The first character in the "+paraName+" should be an alphabet.";
			}
		}
	}
	else if(checkType == "EMAIL")
	{
		//alert("enter the EMAIL zone ");
		if(! isEmailId(fieldValue))
		{
			ErrMsg = "Enter a valid "+paraName;
		
		}
	}

	
	
	
	if(ErrMsg != '')
		return ErrMsg;
			
	//validation forthe length if given the length	
	if((maxLimit != "") && (!isNaN(maxLimit) ) )
		if(fieldValue.length > maxLimit )
		{
		
			ErrMsg = "The " + paraName + " you entered should not be longer than "+maxLimit+" characters.";
		
		}
		
		if(fieldValue.length <= minLimit )
		{
		
			ErrMsg = "The "+ paraName+" you entered must be longer than "+minLimit+" characters.";
		
		}

	if(checkSplCharsExist(fieldValue,splCharString))
	{
		ErrMsg = "The " + paraName +" you entered should not have any special character.";
	}
	
	return ErrMsg;
}	


function trimField(TheField)
{
  if((TheField.type=='text') || (TheField.type=='textarea'))
  {
	var Strfldvalue=TheField.value;
	var Strtrmvalue="";
	var j=0;
    for(k=0; k<Strfldvalue.length; k++)
      {
       if(Strfldvalue.charAt(k)==" " )
		j++;
        else
         {
           if(j<Strfldvalue.length) Strtrmvalue=Strfldvalue.substring(j,Strfldvalue.length);
           break;
         }
       }    
     TheField.value=Strtrmvalue;
   }
}

function trimValue(Strfldvalue,trimChar,direction)
{
	var fieldValue = Strfldvalue;  	
	var j=0;
	if(direction =="LEFT" || direction=="BOTH")
	{
		j=0;
		for(var k=0; k<fieldValue.length;k++)
		{
			if(fieldValue.charAt(k)==" " || fieldValue.charAt(k)==trimChar)
			j++;
			else
			{
				if(j < fieldValue.length) 
				{
					fieldValue = fieldValue.substring(j,fieldValue.length);									
				}
				else
				{
					fieldValue="";
				}
				break;
		     }
		}        
	}	
	if(direction =="RIGHT" || direction=="BOTH")
	{
		j= fieldValue.length;
		for( k=fieldValue.length-1;k>=0;k--)
		{
			if(fieldValue.charAt(k)==" " || fieldValue.charAt(k)==trimChar)
			{
				j--;
			}
			else
			{
				if(j > 0) 
				{
					fieldValue = fieldValue.substring(0,j);
				}
				else
				{
					fieldValue = "";
				}
		        break;
		     }
		}        	
	}	
	return fieldValue;
}



function checkSplCharsExist(fieldValue, splCharString)
{

 for(var i=0;i<splCharString.length;i++) 
 {
	
	if(fieldValue.indexOf(splCharString.charAt(i)) >= 0)
	{
		return true;
	}	
 }

 return false;
        
}


function GetInt(fieldValue)
{
	var intValue = ""+trimValue(fieldValue,'0','LEFT');	
	if(intValue.l=='')
	{
		intValue ='0';
	}
	return parseInt(intValue);
}




function isEmailId(parEmailId)
{
	var state=true;
	var count=0;
	var counta=0;
	var ErrMsg="";

	//no successive two dots
	for(var i=0; i<parEmailId.length-1; i++)
		if((parEmailId.charAt(i)==".")&&(parEmailId.charAt(i+1)=="."))
			state=false;                               
	//no successive two '@'
	for( i=0; i<parEmailId.length-1; i++)
		if((parEmailId.charAt(i)=="@")&&(parEmailId.charAt(i+1)=="@"))
			state=false;                               


	//no successive '.'and'@'
	for( i=0; i<parEmailId.length-1; i++)
		if((parEmailId.charAt(i)==".")&&(parEmailId.charAt(i+1)=="@"))
			state=false;

	//no successive'@' and '.'
	for( i=0; i<parEmailId.length-1; i++)
		if((parEmailId.charAt(i)=="@")&&(parEmailId.charAt(i+1)=="."))
			state=false;

	//the number of "." should be atleast one
	for(i=0; i<parEmailId.length;i++)
	{
		if(parEmailId.charAt(i)==".")
			count=count+1;
	}
	
	if(count<1)
		state=false;

	//the first and last char cannot be "."
	var l= parEmailId.length;
		if((parEmailId.charAt(0)==".")||(parEmailId.charAt(l-1)=="."))
			state=false;
	
	//the first and last char cannot be "@"
	 l= parEmailId.length;
		if((parEmailId.charAt(0)=="@")||(parEmailId.charAt(l-1)=="@"))
			state=false;
	
	//aleast one "@"
	for(i=0; i<parEmailId.length;i++)
	{
		if(parEmailId.charAt(i)=="@")
			counta=counta+1;
	}
	if(counta<1)
		state=false;


	return state;

}

function validatePincode(pincodeField,paraName,mandatory,st)
{
	var msg = "";
	if(mandatory == true || pincodeField.value.length>0)
	{
		msg = validateField(pincodeField,'INT','','',paraName,'');		
		if( msg =="" && pincodeField.value.length != 6)
		{
			msg = paraName + " should be six digits.";
		}
		//if(st==6)
		//var startDigit = pincodeField.value.substring(0,1);				
		//if( msg=="" && startDigit!="6")
		//{
		//	msg = "The " + paraName + " for Tamil Nadu starts with 6.";			
		//}
	}
	return msg;
}

