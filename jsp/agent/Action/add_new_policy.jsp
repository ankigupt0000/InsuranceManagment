<%@ page import="java.sql.* , java.util.*" %>
<%
	try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/INSURE", "root", "");
	String id=request.getParameter("user_id");
	PreparedStatement ps=con.prepareStatement("insert into policy_taken (user_id, plan_id, start_date, duration, payment_duration, amount_insured) values (?,?,now(),?,?,?)");
	ps.setString(1,id);
	ps.setInt(2,Integer.parseInt(request.getParameter("type")));
	ps.setInt(3,Integer.parseInt(request.getParameter("duration")));
	ps.setString(4,request.getParameter("payment_duration"));
	ps.setInt(5,Integer.parseInt(request.getParameter("amt")));
	ps.executeUpdate();
	ps=con.prepareStatement("select max(policy_id) from policy_taken");
	ResultSet rs=ps.executeQuery();
	int policy_id=0;
	if(rs.next())
	{
		policy_id=rs.getInt(1);
	}
	ps=con.prepareStatement("insert into life_insurence_info values (?,?,?,?)");
	ps.setInt(1,policy_id);
	ps.setString(2,request.getParameter("name"));
	String date=request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("date");
	ps.setString(3,date);
	ps.setString(4,request.getParameter("address"));
	ps.executeUpdate();
	response.sendRedirect("../index.jsp?page=get_policy.jsp&msg=1");
	}catch (Exception e)
	{
		out.println(e);
	}
%>