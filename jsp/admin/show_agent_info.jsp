<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.* , java.net.* , java.util.* , java.io.* " %>
<html>
<head>
<title>Agent Information</title>
</head>
<body>
<a style="left:10%; position:absolute" href="javascript: window.history.back();">Back</a><br/>
<table width="80%" align="center">
<tr>
<td colspan="2" align="center"><h1>Agent Information</h1></td>
</tr>
<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/INSURE", "root", "");
	String id=(String)(session.getAttribute("agent_id"));
	PreparedStatement ps=con.prepareStatement("Select agent_id ,first_name ,middle_name ,last_name ,Address_line_1 ,Address_line_2 ,city ,state,country,pincode,phone,mobile,email,date_of_birth,gender,branch_id from agent_info where agent_id=?");
	ps.setString(1,id);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
	%>
	<tr bgcolor="#dddddd">
		<td width="41%"><b>Agent ID:</b></td>
	  <td width="59%"><%=rs.getString("agent_id")%></td>
	</tr>
	<tr>
		<td><b>First Name:</b></td><td><%=rs.getString("first_name")%></td>
	</tr>
	<tr>
		<td><b>Middle Name:</b></td><td><%=rs.getString("middle_name")%></td>
	</tr>
	<tr>
		<td><b>Last Name:</b></td><td><%=rs.getString("last_name")%></td>
	</tr>
	<tr>
		<td><b>Gender:</b></td><td><%=rs.getString("gender")%></td>
	</tr>
	<tr>
		<td><b>Date of Birth:(dd-mm-yyyy)</b></td><td>
		<% java.util.Date DBDate=(java.util.Date)rs.getDate("Date_of_birth");
		int date=DBDate.getDate();
		int month=DBDate.getMonth();
		int year=DBDate.getYear();
		out.println(date+"-"+(month+1)+"-"+(year+1900));
		%>
		</td>
	</tr>	
		<tr bgcolor="#dddddd">
		<td><b>Address Line 1</b></td><td><%=rs.getString("Address_line_1")%></td>
	</tr>
		<tr bgcolor="#dddddd">
		<td><b>Address Line 2</b></td><td><%=rs.getString("Address_line_2")%></td>
	</tr>
	<tr bgcolor="#dddddd">
		<td><b>City</b></td><td><%=rs.getString("city")%></td>
	</tr>
	<tr bgcolor="#dddddd">
		<td><b>State</b></td><td><%=rs.getString("state")%></td>
	</tr>
	<tr bgcolor="#dddddd">
		<td><b>Country</b></td><td><%=rs.getString("country")%></td>
	</tr>
	<tr bgcolor="#dddddd">
		<td><b>Pincode</b></td><td><%=rs.getString("pincode")%></td>
	</tr>
	<tr bgcolor="#dddddd">
		<td><b>Phone:</b></td><td><%=rs.getString("phone")%></td>
	</tr>
	<tr bgcolor="#dddddd">
		<td><b>Mobile:</b></td><td><%=rs.getString("mobile")%></td>
	</tr>
	<tr bgcolor="#dddddd">
		<td><b>Email ID:</b></td><td><%=rs.getString("email")%></td>
	</tr>

	<%
	int branch_id=rs.getInt("branch_id");
	ps=con.prepareStatement("Select name,city,state,country from branch_info where id=?");
	ps.setInt(1,branch_id);
	rs=ps.executeQuery();
	if(rs.next())
	{
	%>
		<tr>
			<td><b>Branch Info</b></td><td><%=rs.getString("name")%> , <%=rs.getString("city")%> , <%=rs.getString("state")%> , <%=rs.getString("country")%></td>
		</tr>
	<%
		
	}
	}
}catch(Exception e){
	out.println(e);
}
%>
</table>
</body>
</html>
