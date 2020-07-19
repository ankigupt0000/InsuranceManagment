<%@ page import="java.sql.*"%>
<%
	try
	{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/INSURE", "root", "");
	PreparedStatement ps=con.prepareStatement("Insert into  premium_history (policy_id,premium_amount,date,status,mode_payment) values (?,?,now(),'Payment Not Received',?)");
	ps.setInt(1,Integer.parseInt(request.getParameter("policy_id")));
	ps.setInt(2,Integer.parseInt(request.getParameter("amount")));
	ps.setString(3,request.getParameter("mode_payment"));
	ps.executeUpdate();
	response.sendRedirect("../add_premium.jsp?msg=1&policy_id="+request.getParameter("policy_id"));
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>