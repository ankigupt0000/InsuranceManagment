<html>
<head>
<title>Insurance::Rate Calculator</title>
<script type="text/JavaScript">
<!--
function Calculate()
{
	var amt=document.getElementById("amt").value;
	var tax=12.38;
	var duration=document.getElementById("duration").value;
	var pre_duration=document.getElementById("pre_duration").value;
	var final_amt=(parseInt(amt)+((parseInt(amt)*tax)/100));
	document.getElementById("total_amt").value=final_amt;
	var pre_amt=final_amt/(pre_duration*duration)
	document.getElementById("pre_amt").value=pre_amt;
}
//-->
</script>
</head>
<body>
<table width="80%" border="0" align="center">
  <tr>
    <td colspan="2"  align="center"><h1>Premium Calculator</h1>
      </td>
  </tr>
  <tr bgcolor="#dddddd">
    <td >Total Amount for Insurance:</td>
    <td><select name="amt" id="amt">
        <option value="50000">50000</option>
        <option value="100000">100000</option>
        <option value="200000">200000</option>
        <option value="300000">300000</option>
        <option value="400000">400000</option>
        <option value="500000">500000</option>
        <option value="600000">600000</option>
        <option value="700000">700000</option>
        <option value="800000">800000</option>
      </select></td>
  </tr>
  <tr bgcolor="#dddddd">
  	<td>Service Tax:</td>
	<td>12.38 %</td>
  </tr>
  <tr>
    <td>Total Duration in Years:</td>
    <td>
	<select name="duration" id="duration" >
		<option value="5">5</option>
		<option value="8">8</option>
		<option value="10">10</option>
		<option value="15">15</option>
	</select>
	</td>
  </tr>
  <tr>
    <td>Premium Duration:</td>
    <td>
		<select name="pre_duration" id="pre_duration">
			<option value="1">Yearly</option>
			<option value="2">Half Yearly</option>
			<option value="12">Monthly</option>
		</select>	</td>
  </tr>
  <tr>
    <td bgcolor="#dddddd">Total Amount to fill:</td>
    <td><input name="tatal_amt" type="text" id="total_amt" readonly="readonly"/></td>
  </tr>
  <tr>
  	<td bgcolor="#dddddd">Premium Amount:</td>
	<td><input type="text" name="pre_amt" id="pre_amt" readonly="readonly"/></td>
  </tr>
  <tr >
  	<td><input name="calculate" type="button" value="Calculate" onClick="Calculate()"/></td><td></td>
  </tr>
  <tr>
  	<td colspan="2"><b>Note: </b> This is an approximation. Please check you actual premium information from nearist  <a href="search_branch.jsp">branch</a></td>
  </tr>
</table>
</body>
</html>