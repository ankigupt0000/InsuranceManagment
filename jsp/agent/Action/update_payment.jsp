<%@ page import="java.sql.* , java.util.*" %>
<%
String premium_id=request.getParameter("premium_id");
	try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/INSURE", "root", "");
	PreparedStatement ps=con.prepareStatement("update premium_history set status='Payment Done' where premium_id=?");
	ps.setString(1,premium_id);
	ps.executeUpdate();
	response.sendRedirect("../see_due_payment.jsp");
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>