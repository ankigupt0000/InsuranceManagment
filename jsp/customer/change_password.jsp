<%@ page import="java.util.*" %>
<script language="javascript" type="text/javascript" >
	function checkAll()
	{
		check_null("current_pass","Current Password");
		check_null("pass","New Password");
		check_null("conf_pass","Confirm Password");
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
<script language="javascript" type="text/javascript" src="../../js/validation1.js">
</script>
<div style="left:20%;position:absolute"><a href="javascript: window.history.back();">Back</a></div>
<div align="center"><h1>Change Password</h1></div>
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
	String arr[] ={"","You have entered wrong current password","Please Login before proceeding","<font color='green'>Password successfully changed</font>"};
	out.println(arr[i]);
%>
	
</div>

<form action="Action/change_password.jsp" method="post" onSubmit="return checkAll()">
<table width="80%" border="0" align="center">
  <tr bgcolor="#dddddd">
    <td>Current Password:</td>
    <td><input name="current_pass" id="current_pass" type="password" size="35" maxlength="35" /></td>
  </tr>
  <tr>
    <td>New Password:</td>
    <td><input name="pass" id="pass" type="password" size="35" maxlength="35" /></td>
  </tr>
  <tr>
    <td>Confirm New Password:</td>
    <td><input name="conf_pass" id="conf_pass" type="password" size="35" maxlength="35" /></td>
  </tr>
  <tr bgcolor="#dddddd">
    <td><input name="change" type="submit" value="Change Password" /></td>
    <td><input name="reset" type="reset" value="Reset" /></td>
  </tr>
</table>
</form>
