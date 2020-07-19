<script language="javascript" type="text/javascript">
	function checkAll()
	{
			check_null("name","Person Name");
			check_null("address","Address");
			check_date();
			if(str=="Please Check the following \n")
			{
				return true;
			}
			else
			{
				alert(str);
				str="Please Check the following \n";
				return false;
			}
	}
var win=null;
function NewWindow(mypage,myname,w,h,scroll,pos){
if(pos=="random"){LeftPosition=(screen.width)?Math.floor(Math.random()*(screen.width-w)):100;TopPosition=(screen.height)?Math.floor(Math.random()*((screen.height-h)-75)):100;}
if(pos=="center"){LeftPosition=(screen.width)?(screen.width-w)/2:100;TopPosition=(screen.height)?(screen.height-h)/2:100;}
else if((pos!="center" && pos!="random") || pos==null){LeftPosition=0;TopPosition=20}
settings='width='+w+',height='+h+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',location=no,directories=no,status=no,menubar=no,toolbar=no,resizable=no';
win=window.open(mypage,myname,settings);}
</script>
<script language="javascript" type="text/javascript" src="../../js/validation1.js">
</script>
<a href="javascript: window.history.back()">Back</a>
<h1 align="center">Get New Policy</h1>
<div style="color:red;" align="center">
<%
	Enumeration e = request.getParameterNames();
	int j=0;
	while (e.hasMoreElements())
	{
    	String name = (String)e.nextElement();
		if(name.equals("msg"))
		{
			j= Integer.parseInt(request.getParameter(name));
		}
	}
	String arr[] ={"","<font color='green'>The values successfully inserted</font>","Please Login before proceeding"};
	out.println(arr[j]);
%>
</div>
<form action="Action/get_policy.jsp" method="post" onSubmit="return checkAll()">
<table width="70%" border="0" align="center">
  <tr bgcolor="#dddddd">
  	<td>Total Amount to pay</td>
    <td><select name="amt" id="amt">
        <option value="50000">50000</option>
        <option value="100000">100000</option>
        <option value="200000">200000</option>
        <option value="300000">300000</option>
        <option value="400000">400000</option>
        <option value="500000">500000</option>
        <option value="600000">600000</option>
        <option value="700000">700000</option>
        <option value="800000">800000</option>
      </select></td>
  </tr>
  <tr bgcolor="#dddddd">
    <td>Plane Type:</td>
    <td>
	<select name="type">
		<option value="2">Life Insurance</option>
		<option value="1">Health Insurance</option>
		<option value="3">Children Plans</otpion>
	</select>
	</td>
  </tr>
  <tr bgcolor="#dddddd">
    <td>Duration</td>
    <td>
		<select name="duration">
			<option value="5">5</option>
			<option value="8">8</option>
			<option value="10">10</option>
			<option value="15">15</option>
		</select>
	</td>
  </tr>
  <tr bgcolor="#dddddd">
    <td>Payment Duration:</td>
    <td>
		<select name="payment_duration">
			<option value="yearly">Yearly</option>
			<option value="half_yearly">Half-yearly</option>
			<option value="monthly">Monthly</option>
		</select><!--<a href="javascript: NewWindow('premium_calculator.jsp','Calculate Premium Amount',478,320,'yes','center')" >Calculate Premium Amount</a>--><a href="premium_calculator.jsp" target="myWindow">Calculate Premium Amount</a><br />
	</td>
  </tr>
  <tr>
    <td colspan="2"><b>Insuring Life of:-</b></td>
  </tr>
  <tr bgcolor="#dddddd">
    <td>Person Name:</td>
    <td><input name="name" type="text" size="20" id="name" maxlength="35" /></td>
  </tr>
  <tr bgcolor="#dddddd">
  	<td>Date of Birth</td>
	<td>
	<select name="date" id="date">
	<%
		for(int i=1;i<=31;i++)
		{
			out.println("<option value='"+i+"'>"+i+"</option>");
		}
	%>
	</select>
	<select name="month" id="month">
	<%
		for(int i=0;i<12;i++)
		{
			out.println("<option value='"+i+"'>"+(i+1)+"</option>");
		}
	%>
	</select>
	<select name="year" id="year">
	<%
		for(int i=2009;i>=1900;i--)
		{
			out.println("<option value='"+i+"'>"+i+"</option>");
		}
	%>
	</select>
</td>
  </tr>
  <tr  bgcolor="#dddddd">
  	<td>Address</td>
	<td><textarea name="address" id="address" cols="20" rows="5"></textarea></td>
  </tr>
  <tr>
  <td><input name="" type="submit" value="Submit" /></td>
  <td><input type="reset" value="Reset" /></td>
  </tr>
  </table>

</form>
