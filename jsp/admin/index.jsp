<%@ page import="java.sql.*" %>
<html>
<head>
<title>
</title>
</head>
<body>
<!--**************************************************************************************************
Project Name				: Insurence Management 
Author						: Ankit Gupta 
email						: ankit.gnu@rediffmail.com
Developed Under				: Academic Free License
URL							: http://sourceforge.net/projects/insurencemgmt/
***************************************************************************************************-->
<h1 align="center">Admin Login Form</h1>
<%
	if(session.getAttribute("admin_id")==null || session.getAttribute("admin_id").equals(""))
	{
		%><form action="Action/login.jsp" method="post" name="admin_login">
<table width="80%" border="0" align="center">
  <tr bgcolor="#dddddd">
    <td>Administrator ID:</td>
    <td><input name="admin_id" type="text" size="35" maxlength="35" />&nbsp;</td>
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
	<table width="80%" border=".5">
  <tr>
    <td><a href="add_plan.jsp">Add a New Plan</a></td>
  </tr>
  <tr>
    <td><a href="agent_registration.jsp">Add a New Agent</a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

	<%
	}
%>
</body>
</html>