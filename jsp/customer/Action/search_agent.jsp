<%@ page import="java.sql.*" %>
<a href="javascript: window.history.back()">Back</a>
<h1 align="center">Search Result</h1>
<table width='80%' align='center'>
<%
	try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/INSURE", "root", "");
	PreparedStatement ps=con.prepareStatement("Select * from agent_info where city ='"+request.getParameter("city")+"' or pincode='"+request.getParameter("pin")+"'");
	ResultSet rs=ps.executeQuery();
	int i=0;
	while(rs.next())
	{
		i++;
		out.println("<tr><td>");
		out.print(rs.getString("first_name"));
		out.print(" "+rs.getString("middle_name"));
		out.println(" "+rs.getString("last_name")+"<br/>");
		out.println(rs.getString("Address_line_1"));
		out.println(rs.getString("Address_line_2"));
		out.println(rs.getString("city")+"<br/>");
		out.print(rs.getString("state")+" , ");
		out.println(rs.getString("country")+"<br/>");
		out.println(rs.getString("pincode")+"<br/>");
		%>
		<hr />
		<%
	}
	if(i==0)
	{
		out.println("<font color='red'>No record found</font> <a href='javascript: window.history.back()'>search again</a>");
	}
	}catch(Exception e)
	{
		out.println(e);
	}
%>
</table>