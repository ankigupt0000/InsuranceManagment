/***************************************************************************************************
Project Name	: Insurence Management 
Author		: Ankit Gupta 
email		: ankit.gnu@rediffmail.com
Developed Under	: Academic Free License.
***************************************************************************************************/
var str="Please Check the following \n";
function check_RegExp(id,name,regexp)
{
	var	string=document.getElementById(id).value;
	if(!string.match(regexp))
	{
			str+="* Field "+name+" has a wrong value \n";
			return false;
	}
	else
	{

			return true;
	}
}
function force_val(id,name,forced_value)
{
	if(!check_null(id,name)){
		document.getElementById(id).value=forced_value;
		return false;
	}
	return true;
}
function force_num_val(id,name,forced_value)
{
	if(!check_numaric(id,name))
	{
		document.getElementById(id).value=forced_value;
		return false;
	}
	return true;
}
function createDate() 
{
	var montharr=new Array("January","February","March","April","May","June","July","August","September","October","November","December");
	var Idate="<select id='date' onchange='check_date()' class='date'>";
	for(var i=1;i<=31;i++) 
	{
		Idate=Idate+"<option>"+i+"</option>";
	}
	Idate+="</select><select id='month' onchange='check_date()' class='month'>";
	for(var i=1;i<=12;i++) 
	{
		Idate+="<option value='"+i+"'>"+i+"</option>";	
	}
	Idate+="</select><select id='year' onchange='check_date()' class='year'>";
	for(var i=2007;i>=1900;i--) 
	{
		Idate+="<option value='"+i+"'>"+i+"</option>";
	}
	Idate+="</select>";
	document.getElementById("Adate").innerHTML=Idate;
}

function check_null( id , name ) 
{
	var value_=document.getElementById(id).value;
	if(value_=="" || value_==null) 
	{
		str+="* This field "+name+" can't be left blank \n";
		return false;		
	}
	else 
	{
		return true;
	}
}

function check_numaric(id , name) 
{
	var is_null=check_null(id,name);
	if(is_null==true) 
	{
		var value_=document.getElementById(id).value;
		if( isNaN(value_) ) 
		{
			str+="* The Field "+name+" must contain numbers only \n";
			return false;
		}
		else 
		{
			return true;
		}
	}
}	
function check_date() 
{
	var str1="";
	var d=document.getElementById("date").value;
	var m=document.getElementById("month").value;
	var y=document.getElementById("year").value;
	if(y%4==0 && m==2 && d>29) 
	{
		str1+="February may be of only 29 days for "+y;
	}
	else if(m==2 && d>28) 
	{
		str1+="February may be of only 28 days for "+y;
	}
	else if((m==4 || m==6 || m==9 || m==11) && d>30) 
	{
		strl+="The month"+" don't have "+d+" date";
	}
	if(str1!="") 
	{
		str+="* "+str1+"\n";
		return false;
	}
	else 
	{
		return true;
	}
}
function check_select(id,name,chk_value) 
{
	var o=document.getElementById(id).value;
	if(o==(chk_value))
	{
		str+="* Please select valid option in field"+name+"\n";
		return false;
	}
	else 
	{
		
		return true;
	}
}
function compare(firstid,secondid,name,msg) 
{	
	if(check_null(secondid,name)) 
	{
		var f=document.getElementById(firstid).value;
		var s=document.getElementById(secondid).value;
		if(s!=f) 
		{
			str+=msg+"\n";
		}
		else 
		{
			return true;
		}
	}
	return false;
}
function check_terms_conds() 
{
	if(document.getElementById("terms_conds").checked != true) 
	{
		str+="* You must accept the Terms and Conditions in order to Sign Up \n";
		return false;
	}
	else 
	{
		return true;
	}
}