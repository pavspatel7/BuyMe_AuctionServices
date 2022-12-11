<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="Ebay_Clone.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Email</title>
</head>
<body>
	<!-- Default header to be used across all non-authenticated pages -->
	<div style="float: right;">
	<form style="display: inline;" method="post" action="EditUser.jsp"><input type="submit" value="Back"></form>
	</div>
	<div style="clear: both;"></div>
	<hr/>
	<!-- End Header -->
	<%
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection connect = db.getConnection();
	
			//Create a SQL statement
			Statement stmt = connect.createStatement();

			String newE = request.getParameter("newE");
			String user  = (String) session.getAttribute("Modify User");
			//Make an insert statement for the Sells table:
			String update = "UPDATE user SET email = \'" + newE + "\' WHERE User_Name = \'" + user + "\'";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = connect.prepareStatement(update);
	
			
			ps.executeUpdate();
	
			connect.close();
			out.print("Email Changed!");
			
		} catch (Exception ex) {
			out.print("Oops! Something Went Wrong!");
		}
%>
</body>
</html>
