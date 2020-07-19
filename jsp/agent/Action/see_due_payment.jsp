<%@ page import="java.sql.* , java.util.*" %>
<%
String cust_id=request.getParameter("cust_id");
%>
<a href="../index.jsp">Home</a>&nbsp;|&nbsp;<a href="javascript: window.history.back();">Back</a>
<h1 align="center">Due Payment of Customer with ID: <%=cust_id%> </h1>
<table width="100%" border="1">
	<thead>
		<th>User Name</th><th>Plan Type</th><th>Polciy</th><th>Premium</th><th>Action</th>
	</thead>
<%
	try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/INSURE", "root", "");
	PreparedStatement ps=con.prepareStatement("select first_name, last_name, plan_name, pt.policy_id , ph.premium_id from policy_taken as pt, premium_history as ph, user_info as ui , plan_info as pi where ui.user_id=pt.user_id and pt.policy_id=ph.policy_id and pi.plan_id=pt.plan_id and status like '%Payment Not Received%' and ui.user_id like '%"+cust_id+"%'");
	ResultSet rs=ps.executeQuery();
	int i=0;
	while(rs.next())
	{
	i++;
	String premium_id=rs.getString(5);
	%>
		<tr align="center"><td><%=rs.getString(1)%> <%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td><td><%=premium_id%></td>
		<td>
			<form action="update_payment.jsp" method="post" onsubmit="confirm('Do you really want to take the responsability to pay for this user?');">
				<input type="hidden" name="premium_id" id="premium_id" value="<%=premium_id%>"/>
				<input type="submit" value="Payment Received" />
			</form>
		</td></tr>
	<%}
	if(i==0)
	{
		out.println("<tr><td colspan='5'>No Record Found</a>");
	}
	}catch(Exception e)
	{
		out.println(e);
	}
	%>
</table>