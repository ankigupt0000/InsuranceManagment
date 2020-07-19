<%@ page import="java.util.*" %>
<a href="javascript: window.history.back()">Back</a>
<h1 align="center">Add Premium to Policy No:<%= request.getParameter("policy_id") %></h1>
<div style="color:red;" align="center">
<%
	Enumeration e = request.getParameterNames();
	int i=0;
	while (e.hasMoreElements())
	{
    	String name = (String)e.nextElement();
		if(name.equals("msg"))
		{
			i= Integer.parseInt(request.getParameter(name));
		}
	}
	String arr[] ={"","Premium Is Successfully Logged in database"};
	out.println(arr[i]);
%>
</div>
		<form action="Action/add_premium.jsp">
		<table>
			<tr>
				<td colspan=2><input type="hidden" name="policy_id" value="<%=request.getParameter("policy_id")%>" /></td>
			</tr>
			<tr>
				<td>Premium Amount:</td><td><input type="text" name="amount" /></td>
			</tr>
			<tr>
				<td>Mode of Payment:</td><td><input type="text" name="mode_payment" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Add Premium" /></td>
			</tr>
		</table>
		</from>
