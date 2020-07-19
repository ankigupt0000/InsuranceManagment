<script language="javascript" type="text/javascript">
	function checkAll()
	{
			check_null("cust_id","Customer_id");
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
	<a href="index.jsp">Home</a>&nbsp;|&nbsp;<a href="javascript: window.history.back();">Back</a>
	<h1 align="center">Due Payments of customer</h1>
	<br/><br/><br/><br/>
	<form action="Action/see_due_payment.jsp" method="post" onsubmit="return checkAll()">
	<table width="100%" align="center">
		<tr align="center"><td>Customer Id:</td><td><input name="cust_id" id="cust_id" type="text" size="35" /></td></tr>
		<tr><td colspan="2"></td></tr>
		<tr><td colspan="2"></td></tr>
		<tr><td colspan="2"></td></tr>
		<tr align="center"><td colspan="2"><input name="" type="submit" value="Submit" /></td></tr>
	</table>
	</form>