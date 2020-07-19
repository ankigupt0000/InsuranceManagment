<%@ page import="java.sql.*" %>
<%
	try
	{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/INSURE", "root", "");
	PreparedStatement ps=con.prepareStatement("Select * from admin where admin_id=? and password=?");
	ps.setString(1,request.getParameter("admin_id"));
	ps.setString(2,request.getParameter("pass"));
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		session.setAttribute("admin_id",rs.getString("admin_id"));
	}
	}catch (Exception e)
	{
		out.println(e);
	}
	response.sendRedirect("../");
%>