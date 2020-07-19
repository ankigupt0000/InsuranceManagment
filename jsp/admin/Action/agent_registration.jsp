<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.* , java.net.* , java.util.* , java.io.* " %>
<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/INSURE", "root", "");
	PreparedStatement ps=con.prepareStatement("Insert into  agent_info (agent_id ,password,first_name ,middle_name ,last_name ,Address_line_1,Address_line_2,city,state,country,pincode,phone,mobile,email,date_of_birth,gender,branch_id) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1,request.getParameter("agent_id"));
	ps.setString(2,request.getParameter("password"));
	ps.setString(3,request.getParameter("first_name"));
	ps.setString(4,request.getParameter("middle_name"));
	ps.setString(5,request.getParameter("last_name"));
	ps.setString(6,request.getParameter("Address_line_1"));
	ps.setString(7,request.getParameter("Address_line_2"));
	ps.setString(8,request.getParameter("city"));
	ps.setString(9,request.getParameter("state"));
	ps.setString(10,request.getParameter("country"));
	ps.setInt(11,Integer.parseInt(request.getParameter("pincode")));
	ps.setString(12,request.getParameter("phone"));
	ps.setString(13,request.getParameter("mobile"));
	ps.setString(14,request.getParameter("email"));
	ps.setInt(15,Integer.parseInt(request.getParameter("branch_id")));
	//	ps.setDate(17,new java.sql.Date(Integer.parseInt(request.getParameter("date")),Integer.parseInt(request.getParameter("month")),Integer.parseInt(request.getParameter("year")-1900)));
	String date=request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("date");
	ps.setString(15,date );
	ps.setString(16,request.getParameter("gender"));
	ps.setString(17,request.getParameter("branch_id"));
	ps.executeUpdate();
	session.setAttribute("agent_id",request.getParameter("agent_id"));
	response.sendRedirect("../show_agent_info.jsp");
	
}catch(Exception e){
	out.println(e);
}
%>