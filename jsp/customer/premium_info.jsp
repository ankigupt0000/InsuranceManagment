<%@ page import="java.sql.* ,java.util.*" %>
<table border="1">
<thead>
<th>Premium Id</th><th>Policy Id</th><th>Premium Amount</th><th>Date</th><th>Status</th>
</thead>
<% 
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/INSURE", "root", "");
	PreparedStatement ps=con.prepareStatement("select * from  premium_history where policy_id=?");
	ps.setString(1,request.getParameter("policy_id"));
	ResultSet rs=ps.executeQuery();
	int i=0;
	while(rs.next())
	{
	i++;
	%>
		<tr><td><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(5)%></td></tr>
	<%
	}
	if(i==0)
	{
	%>
		<tr><td colspan="5"><font color="red" >No Premium Information Found.</font></td></tr>
	<%
	}
}
catch(Exception e)
{
	out.println(e);
}
%>
<tr><td colspan="5">
<form name="add_premium" action="add_premium.jsp">
<input type="hidden" value="<%=request.getParameter("policy_id")%>" name="policy_id" />
<input type="submit" value="Add New Premium" />
</form></td></tr>
</table>
