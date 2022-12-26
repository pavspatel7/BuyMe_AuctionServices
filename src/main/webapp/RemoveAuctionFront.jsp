<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remove Auction</title>
</head>
<body>
	<!-- Default header to be used across all non-authenticated pages -->
	<div style="float: right;">
	<form style="display: inline;" method="post" action="CustomerRepPage.jsp"><input type="submit" value="Back"></form>
	</div>
	<div style="clear: both;"></div>
	<hr/>
	<!-- End Header -->
	<% try {
	
			//Get the database connection
			SqlConnection2 db = new SqlConnection2();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT User_Name, Auction_Num FROM auctions";

			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<h3>Auction List</h3>
	<table border = "1">
		<tr>  
			<td> User_Name  </td>
			<!-- There will be a 5px space here -->
			<td> Auction_Num  </td>
			<!-- There will be a 5px space here -->
		</tr>
		
				<%
			//parse out the results
			if (!result.isBeforeFirst()){
				out.print("No Auctions Yet!");
			}
			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("User_Name") %></td>
					<!-- There will be a 5px space here -->
					<td><%= result.getString("Auction_Num") %></td>
					<!-- There will be a 5px space here -->
				</tr>
			<% }
		
			//close the connection.
			db.closeConnection(con);
			%>
		</table>
		<br>
		<br>
		<form method="post" action="RemoveAuctionBack.jsp">
		<table>
			<tr>
				<td>Auction_Num:</td><td><input type="text" name="Auction_Num" required></td>
			</tr>
		</table>
	
		<input type="submit" value="Remove This Auction">
	</form>
			
		<%} catch (Exception e) {
			out.print("Error");
		}%>

</body>
</html>
