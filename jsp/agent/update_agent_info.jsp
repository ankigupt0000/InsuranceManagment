<%@ page import="java.sql.* , java.util.*"%>
<html>
<head>
	<title>Insurance::Update Agent Information</title>
	<script language="javascript" type="text/javascript" >
		function checkAll()
		{
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
<a href="index.jsp">Home</a>&nbsp;|&nbsp;<a href="javascript: window.history.back();">Back</a>
<form action="Action/update_agent_info.jsp" method="post" onSubmit="return checkAll()">
<div align="center">
  <h1>Update Agent Information</h1>
</div>
<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/INSURE", "root", "");
	String agent_id=(String)(session.getAttribute("agent_id"));
	PreparedStatement ps=con.prepareStatement("Select agent_id ,first_name ,middle_name ,last_name ,Address_line_1 ,Address_line_2 ,city ,state,country,pincode,phone,mobile,email,date_of_birth,gender from agent_info where agent_id=?");
	ps.setString(1,agent_id);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
		String gender=rs.getString("gender");
	%>
<table width="80%" align="center" border="0">
  <tr bgcolor="#FFFFFF">
    <td>First Name:</td>
    <td><input name="first_name" id="first_name" type="text" size="35" maxlength="20" value="<%= rs.getString("first_name")%>"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td>Middle Name:</td>
    <td><input name="middle_name" id="middle_name" type="text" size="35" maxlength="20" value="<%= rs.getString("middle_name")%>"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td>Last Name:</td>
    <td><input name="last_name" id="last_name" type="text" size="35" maxlength="20" value="<%= rs.getString("last_name")%>"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td>Gender</td>
    <td><input id="male" name="gender" type="radio" value="Male" <% if(gender.equals("Male")){out.println("checked='checked'");}%>/><label  for="male">Male</label><input id="female" name="gender" type="radio" value="Female" <% if(gender.equals("Female")){out.println("checked='checked'");}%>/><label  for="female">Female</label></td>
  </tr>
  <tr bgcolor="#ffffff" >
  	<td>Date of Birth</td>
	<td>
	<%
		java.util.Date DBDate=(java.util.Date)rs.getDate("Date_of_birth");
		int date=DBDate.getDate();
		int month=DBDate.getMonth();
		int year=DBDate.getYear();
		out.println("<select id='date' name='date' onchange='check_date()' class='date' >");
		for(int i=1;i<=31;i++)
		{
			if(i==date)
				out.println("<option value=\""+i+"\" selected>"+i+"</option>");
			else
				out.println("<option value=\""+i+"\">"+i+"</option>");
				
		}
		out.println("</select><select id='month' name='month' onchange='check_date()' class='month'>");
		for(int i=1;i<=12;i++)
		{
			if(i==month+1)
			{
				out.println("<option value=\""+i+"\" selected>"+i+"</option>");
			}
			else
			{
				out.println("<option value=\""+i+"\">"+i+"</option>");
			}
		}
		out.println("</select><select id='year' name='year' onchange='check_date()' class='year' >");
		for(int i=2009;i>=1900;i--)
		{
			if(i==year+1900)
			{
				out.println("<option value=\""+i+"\" selected>"+i+"</option>");
			}
			else
			{
				out.println("<option value=\""+i+"\">"+i+"</option>");
			}
		}
		out.println("</select>");
	%></td>
  </tr>
  <tr  bgcolor="#dddddd">
    <td>Address Line 1:</td>
    <td><input name="Address_line_1" id="Address_line_1" type="text" size="35" maxlength="20" value="<%= rs.getString("Address_line_1")%>"></td>
  </tr>
  <tr bgcolor="#dddddd">
    <td>Address Line 2:</td>
    <td><input name="Address_line_2" id="Address_line_2" type="text" size="35" maxlength="20" value="<%= rs.getString("address_line_2")%>"></td>
  </tr>
  <tr bgcolor="#dddddd">
    <td>City:</td>
    <td><input name="city" id="city" type="text" size="35" maxlength="35" value="<%= rs.getString("city")%>">	</td>
  </tr>
  <tr bgcolor="#dddddd">
    <td>State:</td>
    <td><input name="state" id="state" type="text" size="35" maxlength="35" value="<%= rs.getString("state")%>"></td>
  </tr>
  <tr bgcolor="#dddddd">
    <td>Country:</td>
    <td><input name="country" id="country" type="text" size="20" maxlength="20" value="<%= rs.getString("country")%>"></td>
  </tr>
  <tr  bgcolor="#dddddd">
    <td>Pin-code / Zip-code:</td>
    <td><input name="pincode" id="pincode" type="text" size="6" maxlength="6" value="<%= rs.getString("pincode")%>"></td>
  </tr>
  <tr  bgcolor="#dddddd">
    <td>Phone:(with STD code)</td>
    <td><input name="phone" id="phone" type="text" size="10" maxlength="10" value="<%= rs.getString("phone")%>"></td>
  </tr>
  <tr  bgcolor="#dddddd">
    <td>Mobile Number:</td>
    <td><input name="mobile" id="mobile" type="text" size="12" maxlength="12" value="<%= rs.getString("mobile")%>"></td>
  </tr>
  <tr  bgcolor="#dddddd">
    <td>E-Mail:</td>
    <td><input name="email" id="email" type="text" size="40" maxlength="40" value="<%= rs.getString("email")%>"></td>
  </tr>
  <tr bgcolor="#dddddd">
  	<td><input name="register" type="submit" value="Update Information"></td>
	<td><input name="reset" type="button" value="Reset" ></td>
  </tr>
</table>
<%
	}
}catch(Exception e){
	out.println(e);
}
%>

</form>
</body>
</html>
