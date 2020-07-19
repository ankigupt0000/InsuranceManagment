<%@ page import="java.sql.*"%>
<%
	try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/INSURE", "root", "");
	PreparedStatement ps=con.prepareStatement("insert into plan_info(plan_name,description) values(?,?)");
	ps.setString(1,request.getParameter("plan_name"));
	ps.setString(2,request.getParameter("desc"));
	ps.executeUpdate();
	}catch (Exception e)
	{
		out.println(e);
	}
//	response.sendRedirect("../index.jsp");
%>
	