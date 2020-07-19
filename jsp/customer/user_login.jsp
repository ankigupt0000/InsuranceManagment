<%@ page import="java.util.*" %>
<script language="javascript" type="text/javascript" >
	function checkAll()
	{
			check_null("user_id","User Name");
			check_null("password","Password");
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
<script language="javascript" type="text/javascript" src="../../js/validation1.js" >
</script>
<div><a href="javascript: window.history.back();">Back</a></div>
<div align="center"><h1>User Login</h1></div>
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
<form action="Action/user_login.jsp" method="post" onSubmit="return checkAll()">
<table width="80%" border="0" align="center">
  <tr bgcolor="#dddddd">
    <td>User Name:</td>
    <td><input name="user_id" type="text" size="35" maxlength="35" id="user_id"/></td>
  </tr>
  <tr bgcolor="#dddddd">
    <td>Password:</td>
    <td><input id="password" name="password" type="password" size="35" maxlength="35" /></td>
  </tr>
  <tr>
    <td><input name="login" type="submit" value="Login" /></td>
    <td><input name="reset" type="reset" value="Reset" /></td>
  </tr>
  <tr>
    <td></td>
    <td></td>
  </tr>
</table>

</form>