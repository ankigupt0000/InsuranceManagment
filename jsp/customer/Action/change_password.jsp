
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.* ,java.util.*" %>

<% 
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/INSURE", "root", "");

String old_pass=request.getParameter("current_pass");
String pass=request.getParameter("pass");
String cpass=request.getParameter("conf_pass");
%>
<script language="javascript" type="text/javascript">
alert("<% out.println(old_pass+" "+pass+" "+cpass); %>");
</script>
<%
String uid=(String)session.getAttribute("id");
String usertype=(String) session.getAttribute("usertype");
if(pass.equals(cpass))
{
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select PASSWORD from USER_INFO where USER_ID='"+uid+"'");
		String db_pass=null;
		if(rs.next())
		{	
			db_pass=rs.getString(1);
		}
		if(db_pass.equals(old_pass))
		{
			PreparedStatement ps=con.prepareStatement("update USER_INFO set PASSWORD=? where USER_ID=?");
			ps.setString(1,pass);
			ps.setString(2,uid);
			ps.executeUpdate();
			response.sendRedirect("../change_password.jsp?msg=3");
		}
		else
		{
			response.sendRedirect("../change_password.jsp?msg=1");
		}
	}
	con.close();
}catch(Exception e)
{
	out.println(e);
}
%>
