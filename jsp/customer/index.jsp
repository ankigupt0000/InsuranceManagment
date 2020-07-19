<%@ page import="java.sql.* " %>
<%String user_id=(String)session.getAttribute("id");%>
<html>
<head><title>Insurence::Home Page</title></head>
<body>
<!--**************************************************************************************************
Project Name				: Insurence Management 
Author						: Ankit Gupta 
email						: ankit.gnu@rediffmail.com
Developed Under				: Academic Free License
URL							: http://sourceforge.net/projects/insurencemgmt/
***************************************************************************************************-->
<table width="100%" border="0">
  <tr width="100%">
  	<td colspan="3"><img src="../../images/banner.jpg" width=100% height=200></td>
  </tr>
  <tr>
    <td width="20%" height="578" rowspan="2" valign="top">
		<table width="95%" border="0" bgcolor="#dddddd"  >
		  <tr align="center">
		  	<td><a href="index.jsp">Home</a></td>
		  </tr>
		  <tr align="center">
		    <td><a href="index.jsp?page=plan_info.jsp" >Plan Information</a>&nbsp;</td>
		  </tr>
		  <tr align="center">
		    <td><a href="index.jsp?page=premium_calculator.jsp">Premium Calculator</a></td>
	      </tr>		  
		  <tr align="center">
		    <td>&nbsp;</td>
		  </tr>
		  <%
		  	if(!(user_id==(null) || user_id.equals("")))
			{
			%>
			
		  <tr align="center">
		    <td><a href="index.jsp?page=get_policy.jsp">Get a New Policy Plan</a>&nbsp;</td>
		  </tr>
		  <tr align="center">
            <td><a href="index.jsp?page=view_policy_info.jsp">Your Owned Policies</a></td>
	      </tr>
		  <!--<tr align="center">
            <td><a href="claim.jsp">Claim Insurance</a>&nbsp;</td>
	      </tr>
		  <tr align="center">
            <td><a href="premium_info.jsp">Premium Information</a>&nbsp;</td>
	      </tr>-->
		  <%}%>
		  <tr align="center">		  
			<td>&nbsp;</td>
		</tr>
		<tr align="center">
			<td><a href="index.jsp?page=search_branch.jsp">Locate Branch</a></td>
		</tr>
		<tr align="center">
		    <td><a href="index.jsp?page=search_agent.jsp">Locate Agent</a></td>
	      </tr>
		  <tr align="center">
		    <td>&nbsp;</td>
	      </tr>
		  <tr align="center">
		    <td>&nbsp;</td>
	      </tr>
		  <tr align="center">
		    <td>&nbsp;</td>
	      </tr>
		  <tr align="center">
		    <td>&nbsp;</td>
	      </tr>
		  <tr align="center">
		    <td>&nbsp;</td>
	      </tr>
		  <tr align="center">
		    <td>&nbsp;</td>
		  </tr>
		</table>	</td>
    <td width="60%" rowspan="2" valign="top">
	<% String page1=request.getParameter("page"); 
	if(page1==(null)  || page1.equals(""))
	{
	%>
	<%@ include file="main.jsp" %>
	<%
	}
	else if(page1.equals("plan_info.jsp")){ 
	%>
	<%@ include file="plan_info.jsp" %>
	<%}
	else if(page1.equals("update_user_info.jsp"))
	{
	%>
	<%@ include file="update_user_info.jsp" %>
	<%
	}else if(page1.equals("change_password.jsp"))
	{
	%>
	<%@ include file="change_password.jsp" %>
	<%
	}else if(page1.equals("user_login.jsp"))
	{
	%>
	<%@ include file="user_login.jsp" %>
	<%
	}
	else if(page1.equals("user_registration.jsp"))
	{
	%>
	<%@ include file="user_registration.jsp" %>
	<%
	}
	else if(page1.equals("premium_calculator.jsp"))
	{
	%>
	<%@ include file="premium_calculator.jsp" %>
	<%
	}
	else if(page1.equals("search_branch.jsp"))
	{
	%>
	<%@ include file="search_branch.jsp" %>
	<%
	}
	else if(page1.equals("Action/search_branch.jsp"))
	{
	%>
	<%@ include file="Action/search_branch.jsp" %>
	<%
	}
	else if(page1.equals("get_policy.jsp"))
	{
	%>
	<%@ include file="get_policy.jsp" %>
	<%
	}
	else if(page1.equals("Action/get_policy.jsp"))
	{
	%>
	<%@ include file="Action/get_policy.jsp" %>
	<%
	}
	else if(page1.equals("view_policy_info.jsp"))
	{
	%>
	<%@ include file="view_policy_info.jsp" %>
	<%
	}else if(page1.equals("search_agent.jsp"))
	{
	%>
	<%@ include file="search_agent.jsp" %>
	<%
	}else if(page1.equals("Action/search_agent.jsp"))
	{
	%>
	<%@ include file="Action/search_agent.jsp" %>
	<%
	}else if(page1.equals("show_user_info.jsp"))
	{
	%>
	<%@ include file="show_user_info.jsp" %>
	<%
	}	
	%>

	</td>
    <td width="20%" valign="top">
			<table width="100%" border="0" bgcolor="#dddddd" align="center">
	<%
		if(user_id==(null) || user_id.equals(""))
		{
			%>
				<tr align="center">
					<td>Agents <a href="../agent/index.jsp">Login Here</a></td>
				</tr>
				<tr align="center">
					<td>Registered User <a href="index.jsp?page=user_login.jsp">Login Here</a></td>
				</tr>
				
				<tr align="center">
					<td>New User !!! <a href="index.jsp?page=user_registration.jsp">Sign Up here</a></td>
				</tr>
			<%	
		}
		else
		{
		%>

	      <tr align="center">
	        <td>Welcome <%= (String)session.getAttribute("id")%> <a href="Action/signout.jsp">Sign Out</a></td>
	      </tr>
	      <tr align="center">
	        <td><a href="index.jsp?page=update_user_info.jsp">Update Profile</a></td>
	      </tr>
	      <tr align="center">
	        <td><a href="index.jsp?page=change_password.jsp" >Change Password</a></td>
	      </tr>
	      <tr align="center">
    	    <td>&nbsp;</td>
	      </tr>

		<%
		}
		%>
			    </table>
	</td>
  </tr>
</table>
</body>
</html>