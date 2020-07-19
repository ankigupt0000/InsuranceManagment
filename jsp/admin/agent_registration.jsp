<%@ page import="java.sql.*" %>
<html>
<head>
	<title>Insurance::Agent Registration Form</title>
	<script language="javascript" type="text/javascript" >
		function checkAll()
		{
			check_null("agent_id","Agent ID");
			check_null("password","Password");
			check_null("confirm_password","Confirm Password");
			compare("password","confirm_password","Password","The two passwords don't match");
			check_null("first_name","First Name");
			check_null("last_name","Lirst Name");
			check_null("Address_line_1","Address Line 1");
			check_null("Address_line_2","Address Line 2");
			check_null("city","City");
			check_null("state","State");
			check_null("country","Country");
			check_numaric("pincode","Pin code");
			check_numaric("phone","Phone Number");
			check_numaric("mobile","Mobile Number");
			check_RegExp("email","EMail Id",/^([a-zA-Z0-9])+([\.a-zA-Z0-9_-])*@([a-zA-Z0-9])+(\.[a-zA-Z0-9_-]+)+$/);
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
	</script>
	<script language="javascript" type="text/javascript" src="../../js/validation1.js">
	</script>
</head>
<body>
<a href="javascript: window.history.back();">Back</a>
<form action="Action/agent_registration.jsp" method="post" onSubmit="return checkAll()">
<div align="center"><h1>Agent Registration Form</h1></div>
<table width="80%" align="center" border="0">
  <tr bgcolor="#dddddd">
    <td>Agent ID: (Max. length: 35)</td>
	<td><input name="agent_id" id="agent_id" type="text" size="35" maxlength="35"></td>
  </tr>
  <tr bgcolor="#dddddd">
    <td>Password:(Max. length: 35)</td>
    <td><input name="password" id="password" type="password" size="35" maxlength="35"></td>
  </tr>
  <tr bgcolor="#dddddd">
    <td>Confirm Password:</td>
    <td><input name="confirm_password" id="confirm_password" type="password" size="35" maxlength="35"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td>First Name:</td>
    <td><input name="first_name" id="first_name" type="text" size="35" maxlength="20"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td>Middle Name:</td>
    <td><input name="middle_name" id="middle_name" type="text" size="35" maxlength="20"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td>Last Name:</td>
    <td><input name="last_name" id="last_name" type="text" size="35" maxlength="20"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td>Gender</td>
    <td><input name="gender" type="radio" value="Male" id="male" checked="checked"><label for="male"> Male</label>  <input name="gender" type="radio" value="Female" id="female"><label for="female">Female</label></td>
  </tr>
  <tr bgcolor="#ffffff" >
  	<td>Date of Birth</td>
	<td>
	<select name="date">
	<%
		for(int i=1;i<=31;i++)
		{
			out.println("<option value='"+i+"'>"+i+"</option>");
		}
	%>
	</select>
	<select name="month">
	<%
		for(int i=0;i<12;i++)
		{
			out.println("<option value='"+i+"'>"+(i+1)+"</option>");
		}
	%>
	</select>
	<select name="year">
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
    <td>Address Line 1:</td>
    <td><input name="Address_line_1" id="Address_line_1" type="text" size="35" maxlength="20"></td>
  </tr>
  <tr bgcolor="#dddddd">
    <td>Address Line 2:</td>
    <td><input name="Address_line_2" id="Address_line_2" type="text" size="35" maxlength="20"></td>
  </tr>
  <tr bgcolor="#dddddd">
    <td>City:</td>
    <td><input name="city" id="city" type="text" size="35" maxlength="35">	</td>
  </tr>
  <tr bgcolor="#dddddd">
    <td>State:</td>
    <td><input name="state" id="state" type="text" size="35" maxlength="35"></td>
  </tr>
  <tr bgcolor="#dddddd">
    <td>Country:</td>
    <td><input name="country" id="country" type="text" size="20" maxlength="20"></td>
  </tr>
  <tr  bgcolor="#dddddd">
    <td>Pin-code / Zip-code:</td>
    <td><input name="pincode" id="pincode" type="text" size="6" maxlength="6"></td>
  </tr>
  <tr  bgcolor="#dddddd">
    <td>Phone:(with STD code)</td>
    <td><input name="phone" id="phone" type="text" size="10" maxlength="10"></td>
  </tr>
  <tr  bgcolor="#dddddd">
    <td>Mobile Number:</td>
    <td><input name="mobile" id="mobile" type="text" size="12" maxlength="12"></td>
  </tr>
  <tr  bgcolor="#dddddd">
    <td>E-Mail:</td>
    <td><input name="email" id="email" type="text" size="40" maxlength="40"></td>
  </tr>
  <tr>
  	<td>Related Branch:</td>
	<td><select name="branch_id">
	<%
	try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/INSURE", "root", "");
	PreparedStatement ps=con.prepareStatement("select id,name,city,state,country from branch_info");
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
	%>
		<option value="<%= rs.getString("id") %>" ><% out.println(rs.getString("name")+" , "+rs.getString("city")+" , "+rs.getString("state")+" , "+rs.getString("country")); %></option>
	<%
	}
	}catch(Exception e)
	{
		out.println(e);
	}
	%>
	</select></td>
  </tr>
  <tr>
  	<td><input name="register" type="submit" value="Register"></td>
	<td><input name="reset" type="button" value="Reset" ></td>
  </tr>
</table>
</form>
</body>
</html>