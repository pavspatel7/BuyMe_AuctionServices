<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remove Bids</title>
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
			String str = "SELECT User_Name, Auction_Num, Bid_Num, Bid_Price FROM buyer_bids";

			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<h3>Bids History</h3>
	<table border = "1">
		<tr>
			<td> User_Name </td>  
			<td> Auction_Num  </td>
			<td> Bid_Num  </td>
			<td> Bid_Price  </td>
		</tr>
		
				<%
			//parse out the results
			if (!result.isBeforeFirst()){
				out.print("No Bids Yet!");
			}
			
			while (result.next()) { %>
				<tr> 
					<td><%= result.getString("User_Name") %></td>
					<!-- There will be a 5px space here -->  
					<td><%= result.getString("Auction_Num") %></td>
					<!-- There will be a 5px space here -->
					<td><%= result.getString("Bid_Num") %></td>
					<!-- There will be a 5px space here -->
					<td><%= result.getString("Bid_Price") %></td>
					<!-- There will be a 5px space here -->
				</tr>
			<% }
		
			//close the connection.
			db.closeConnection(con);
			%>
		</table>
		<br>
		<br>
		<form method="post" action="RemoveBidsBack.jsp">
		<table>
			<tr>
				<td>Bid_Num:</td><td><input type="text" name="Bid_Num" required></td>
			</tr>
			<tr>
				<td>Auction_Num :</td><td><input type="text" name="Auction_Num" required></td>
			</tr>
			
		</table>
	
		<input type="submit" value="Remove This Bid">
	</form>
			
		<%} catch (Exception e) {
			out.print("Error");
		}%>

</body>
</html>
