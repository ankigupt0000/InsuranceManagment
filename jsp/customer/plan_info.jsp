<%@ page import="java.sql.*" %>
<table>
<%
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/INSURE", "root", "");
	PreparedStatement ps=con.prepareStatement("Select * from plan_info");
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
		%>
		<tr>
			<td><li><b><%=rs.getString("plan_name")%></b> <br/> <%=rs.getString("description") %></td>
		</tr>
		<%
	}
%>
</table>
