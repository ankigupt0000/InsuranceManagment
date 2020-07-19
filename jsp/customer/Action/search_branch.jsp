<%@ page import="java.sql.*" %>
<a href="javascript: window.history.back()">Back</a>
<h1 align="center">Search Result</h1>
<table width='80%' align='center'>
<%
	try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/INSURE", "root", "");
	PreparedStatement ps=con.prepareStatement("Select * from branch_info where city ='"+request.getParameter("city")+"' or pin='"+request.getParameter("pin")+"'");
	ResultSet rs=ps.executeQuery();
	int i=0;
	while(rs.next())
	{
		i++;
		out.println("<tr><td>");
		out.println(rs.getString("name"));
		out.println(rs.getString("Address"));
		out.println(rs.getString("city")+"<br/>");
		out.print(rs.getString("state")+" , ");
		out.println(rs.getString("country")+"<br/>");
		out.println(rs.getString("pin")+"<br/>");
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