<%@ page import="java.sql.*" %>
<%
	try
	{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/INSURE", "root", "");
	PreparedStatement ps=con.prepareStatement("Select * from agent_info where agent_id=? and password=?");
	ps.setString(1,request.getParameter("agent_id"));
	ps.setString(2,request.getParameter("pass"));
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		session.setAttribute("agent_id",rs.getString("agent_id"));
		response.sendRedirect("../index.jsp");
	}
	else
	{
		response.sendRedirect("../?msg=1");
	}
	}catch (Exception e)
	{
		out.println(e);
	}

%>