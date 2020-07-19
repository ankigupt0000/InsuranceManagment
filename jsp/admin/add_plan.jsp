<html>
<head><title>Insurance::admin::Add new Plan</title></head>
<script language="javascript" type="text/javascript">
function checkAll()
		{
			check_null("plan_name","Plan Name");
			check_null("desc","Description");
			check_numaric("max_amt","Maximum Amount");
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
<body>
<form action="Action/add_plan.jsp" method="post" onSubmit="return checkAll()">
<table width="80%" border="0">
  <tr>
    <td colspan="2" align="center"><font size="+4">Add new Plan</font></td>
  </tr>
  <tr>
    <td>Plan Name:</td>
    <td><input name="plan_name" id="plan_name" type="text" size="30" maxlength="100" /></td>
  </tr>
  <tr>
    <td>Description:</td>
    <td><textarea name="desc"  id="desc" cols="50" rows="10"></textarea></td>
  </tr>
  <tr>
  	<td>Maximum Amount Allowed for Insurance</td>
	<td><input name="max_amt" id="max_amt" type="text" size="10" maxlength="10"></td>
  </tr>
  <tr>
    <td><input name="" type="submit" value="Add Plan" /></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
</body>
</html>