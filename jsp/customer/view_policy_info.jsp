<%@ page import="java.sql.* ,java.util.*" %>
<script language="javascript" type="text/javascript">
var win=null;
function NewWindow(mypage,myname,w,h,scroll,pos){
if(pos=="random"){LeftPosition=(screen.width)?Math.floor(Math.random()*(screen.width-w)):100;TopPosition=(screen.height)?Math.floor(Math.random()*((screen.height-h)-75)):100;}
if(pos=="center"){LeftPosition=(screen.width)?(screen.width-w)/2:100;TopPosition=(screen.height)?(screen.height-h)/2:100;}
else if((pos!="center" && pos!="random") || pos==null){LeftPosition=0;TopPosition=20}
settings='width='+w+',height='+h+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',location=no,directories=no,status=no,menubar=no,toolbar=no,resizable=no';
win=window.open(mypage,myname,settings);}
</script>
<a href="window.history.back()">Back</a>
<h1 align="center">Policy Information</h1>
<table width="100%" border="1">
<thead>
	<tr><th>Policy ID</th><th>Plan Type</th><th>Start Date( yyyy-mm-dd )</th><th>Duration (in years)</th><th>Payment Duration</th><th>Amount Insured</th></tr>
</thead>
<% 
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/INSURE", "root", "");
	PreparedStatement ps=con.prepareStatement("Select policy_id,plan_name,start_date,duration,payment_duration,amount_insured from policy_taken,plan_info where user_id=? and plan_info.plan_id=policy_taken.plan_id");
	ps.setString(1,session.getAttribute("id").toString());
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
	int policy_id=rs.getInt(1);
	%>
		<tr><td><a href="premium_info.jsp?policy_id=<%=policy_id%>" target="myWindow"><%=policy_id%></a></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(5)%></td><td><%=rs.getString(6)%></tr>
	<%
	}
	}
	catch (Exception e)
	{
		out.println(e);
	}
%>
</table>