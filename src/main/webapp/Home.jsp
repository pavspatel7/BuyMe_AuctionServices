<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="CACHE-CONTROL" content="NO-CACHE" />
<title>By Me</title>
</head>
<body>
	
	<%
		HttpSession sess = request.getSession(false);
		String name = (String)sess.getAttribute("Users");
	
		response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0"); 
		
		if(session.getAttribute("Users")==null)
		{
		    response.sendRedirect(request.getContextPath() + "/logout.jsp");
		}
	%>
	<%= name %>

	<form action = "logout.jsp" method = "post">
		<input type = "submit" value = "Log out">
	</form>
	
	<form action = "Display.jsp">
		<Input Type = 'text' Placeholder = 'Search' Name = 'Search'>
		<Input Type = 'Submit' Value = 'Submit' Name = 'Click'>
	</form>

</body>
</html>