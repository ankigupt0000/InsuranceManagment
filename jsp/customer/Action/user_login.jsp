<%@ page import="java.sql.*"%>
<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/INSURE", "root", "");
	PreparedStatement ps=con.prepareStatement("Select user_id from user_info where user_id = ? and password = ?");
	ps.setString(1,request.getParameter("user_id"));
	ps.setString(2,request.getParameter("password"));
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		session.setAttribute("id",request.getParameter("user_id"));
		response.sendRedirect("../");
	}
	else
	{
		response.sendRedirect("../user_login.jsp?msg=1");
	}
}catch (Exception e)
{
	out.println(e);
}
%>