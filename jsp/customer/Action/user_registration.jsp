<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.* , java.net.* , java.util.* , java.io.* " %>
<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/INSURE", "root", "");
	String user_id=request.getParameter("user_id");
	PreparedStatement ps=con.prepareStatement("select user_id from user_info where user_id=?");
	ps.setString(1,user_id);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		response.sendRedirect("../index.jsp?page=user_registration.jsp&msg=2");
	}
	ps=con.prepareStatement("Insert into  user_info (user_id ,password,first_name ,middle_name ,last_name ,Address_line_1,Address_line_2,city,state,country,pincode,phone,mobile,email,occupation,annual_incom,date_of_birth,gender) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1,user_id);
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
	ps.setString(15,request.getParameter("occupation"));
	ps.setInt(16,Integer.parseInt(request.getParameter("annual_incom")));
	//	ps.setDate(17,new java.sql.Date(Integer.parseInt(request.getParameter("date")),Integer.parseInt(request.getParameter("month")),Integer.parseInt(request.getParameter("year")-1900)));
	String date=request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("date");
	ps.setString(17,date );
	ps.setString(18,request.getParameter("gender"));
	ps.executeUpdate();
	session.setAttribute("id",request.getParameter("user_id"));
	response.sendRedirect("../show_user_info.jsp");
	
}catch(Exception e){
	out.println(e);
}
%>