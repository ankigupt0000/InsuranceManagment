<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.* , java.net.* , java.util.* , java.io.* " %>
<%
String id=(String)session.getAttribute("agent_id");
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/INSURE", "root", "");
	PreparedStatement ps=con.prepareStatement("update agent_info set first_name =?,middle_name =?,last_name =?,Address_line_1=?,Address_line_2=?,city=?,state=?,country=?,pincode=?,phone=?,mobile=?,email=?,date_of_birth=?,gender=? where agent_id=?");
	ps.setString(1,request.getParameter("first_name"));
	ps.setString(2,request.getParameter("middle_name"));
	ps.setString(3,request.getParameter("last_name"));
	ps.setString(4,request.getParameter("Address_line_1"));
	ps.setString(5,request.getParameter("Address_line_2"));
	ps.setString(6,request.getParameter("city"));
	ps.setString(7,request.getParameter("state"));
	ps.setString(8,request.getParameter("country"));
	ps.setString(9,request.getParameter("pincode"));
	ps.setString(10,request.getParameter("phone"));
	ps.setString(11,request.getParameter("mobile"));
	ps.setString(12,request.getParameter("email"));
//	ps.setDate(15,new java.sql.Date(Integer.parseInt(request.getParameter("date")),Integer.parseInt(request.getParameter("month")),Integer.parseInt(request.getParameter("year"))));
	String date=request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("date");
	ps.setString(13,date );
	ps.setString(14,request.getParameter("gender"));
	ps.setString(15,id);
	ps.executeUpdate();
	response.sendRedirect("../show_agent_info.jsp");
	
}catch(Exception e){
	out.println(e);
}
%>