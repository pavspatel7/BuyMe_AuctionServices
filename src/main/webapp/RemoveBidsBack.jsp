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
	<form style="display: inline;" method="post" action="RemoveBidsFront.jsp"><input type="submit" value="Back"></form>
	</div>
	<div style="clear: both;"></div>
	<hr/>
	<!-- End Header -->
	<%
		try {
			//Get the database connection
			SqlConnection2 db = new SqlConnection2();	
			Connection connect = db.getConnection();
	
			//Create a SQL statement
			Statement stmt = connect.createStatement();

			String Bid_Num = request.getParameter("Bid_Num");
			String Auction_Num = request.getParameter("Auction_Num");
			
			Boolean Winner, CurrentWinner;
			String check = "Select * FROM buyer_bids LEFT JOIN auctions Using (Auction_Num) WHERE Auction_Num = " + Auction_Num +" AND buyer_Bids.Bid_Price = auctions.Winning_Bid";
			ResultSet result = stmt.executeQuery(check);
			
			
					String delete = "DELETE FROM buyer_Bids WHERE Bid_Num = " + Bid_Num;
					PreparedStatement ps = connect.prepareStatement(delete);
					ps.executeUpdate();
					String update = "UPDATE auctions SET Winning_Bid = (Select Max(Bid_Price) From buyer_Bids Where Auction_Num = " + Auction_Num + ") WHERE Auction_Num = " + Auction_Num ;
					ps = connect.prepareStatement(update);
					ps.executeUpdate();
					
					out.print("Success! This Bid No Longer Exists!");
				
			
		
			connect.close();
			
		} catch (Exception ex) {
			out.print("Something Went Wrong!");
		}
%>
</body>
</html>
