<%@ page import="java.sql.* , java.util.* " %>
<html>
<head><title>Agent Home Page</title></head>
<body>
<!--**************************************************************************************************
Project Name				: Insurence Management 
Author						: Ankit Gupta 
email						: ankit.gnu@rediffmail.com
Developed Under				: Academic Free License
URL							: http://sourceforge.net/projects/insurencemgmt/
***************************************************************************************************-->
<img src="../../images/banner.jpg" width="100%" height="200"/>
<!--<a href="javascript: window.history.back()">Back</a>-->
<h1 align="center">Agent Home Page</h1>
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
	String arr[] ={"","The user name or password is wrong","Please Login before proceeding"};
	out.println(arr[i]);
%>
	
</div>

<%
	if(session.getAttribute("agent_id")==null || session.getAttribute("agent_id").equals(""))
	{
		%><form action="Action/login.jsp" method="post" name="agent_login">
<table width="60%" border="0" align="center">
  <tr bgcolor="#dddddd">
    <td>Agent ID:</td>
    <td><input name="agent_id" type="text" size="35" maxlength="35" />&nbsp;</td>
  </tr>
  <tr bgcolor="#dddddd">
    <td>Password</td>
    <td><input name="pass" type="password" size="35" maxlength="35" />&nbsp;</td>
  </tr>
  <tr>
    <td><input name="" type="submit" value="Login" /></td>
	<td><input name="" type="reset" value="Reset"/></td>
  </tr>
</table>
</form>
		<%
	}
	else
	{
	%>
<table>
	<tr><td width=25%>
	<table width=100% border="0" bgcolor="#dddddd">
  <tr>
    <td>Welcome <%=session.getAttribute("agent_id")%> <a href="Action/signout.jsp">Sign Out</a></td>
  </tr>
  <tr>
    <td><a href="update_agent_info.jsp">View and Update Profile</a></td>
  </tr>
  <tr>
  	<td><a href="add_new_policy.jsp">Add New Policy</a></td>
  </tr>
  <tr>
    <td><a href="see_due_payment.jsp">See Customer's due payment</a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</td>
<td width=55%>
This page is to manage the work done by the Agent of the Insurance Organization. The agents can directly interact with the user take the
responsibility of the premium submission. The agent can work on this basic home page for easing their work </td>
<td width=20%></td>
</tr>
</table>
	<%
	}
%>
</body>
</html>