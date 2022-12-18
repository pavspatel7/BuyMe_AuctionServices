<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.time.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<%
		final String URL = "jdbc:mysql://127.0.0.1:3306/?user=root";
		final String PASS = "root";
		final String USER = "root";
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			Statement stmt = con.createStatement();
			Statement stmt1 = con.createStatement();
			Statement stmt2 = con.createStatement();
			Statement stmt3 = con.createStatement();
			Statement stmt4 = con.createStatement();
			
			HttpSession sess = request.getSession(false);
			ResultSet rows;
		
			
			String userName = (String)sess.getAttribute("UserId");
			int aId, pId;
			boolean autoBid = false;
			
//****************************************************     GET AUCTION ID FROM USERNAME IN BIDS TABLE    *************************************************************************************
			String query1 = "SELECT Auction_Num FROM clone.buyer_bids WHERE User_Name = '"+userName+"' GROUP BY (Auction_Num)";
			rows = stmt.executeQuery(query1);
			
			%> <h1> Alerts Related to Bids</h1> <br><%

			
			while(rows.next())
			{
				aId = rows.getInt("Auction_Num");
				
//********************************************   SELECT HIGEST BID AMONG THE BID VALUES FOR THAT AUCTION *********************************************
				String query2 = "SELECT User_Name, Bid_Price FROM clone.buyer_bids WHERE Bid_Price = (SELECT MAX(Bid_Price) FROM clone.buyer_bids  WHERE Auction_Num = '"+aId+"') AND Auction_Num = '"+aId+"'";

				ResultSet rows1 = stmt1.executeQuery(query2);
				rows1.next();
				
				float higestprice = rows1.getFloat("Bid_Price");
				String maxBidder = rows1.getString("User_Name");
		
				
// ****************************************   CHECK IF THE CURREN USER IS THE HIGEST BIDDER IF NOT THEN ALEAR THEM  *****************************************************
				if(!maxBidder.equalsIgnoreCase(userName))
				{
					
					
					String query3 = "SELECT Pid FROM clone.product_for_auction WHERE Auction_Num = '"+aId+"'";
					ResultSet rows2 = stmt2.executeQuery(query3);
					rows2.next();
					pId = rows2.getInt("Pid");
					
					
					
					String query4 = "SELECT p.Brand, p.Model, a.End_Date_Time, a.Increment_Amount, a.Auction_Num FROM clone.product p, clone.auctions a WHERE a.Auction_Num = '"+aId+"' AND p.Pid = '"+pId+"'";
					rows2 = stmt2.executeQuery(query4);
					
					while(rows2.next())
					{
						%>
						<p> 
							<h2>Alert!</h2>
							For auction <%= aId %>:<br> 
							<%=rows2.getString("Brand")%>, <%=rows2.getString("Model")%> : someone has bid $<%=higestprice %> more. <br>
							This auction will be ending in: <%=rows2.getString("End_Date_Time") %>
						</p>
						<% 
					}
//******************************************* AFTER ALERTING CHECK: USER HAVE SET UP AUTO BIDDING  ****************************************************************************				
					String query5 = "SELECT Upper_Limit, Increment_Price FROM clone.buyer_bids WHERE Auction_Num = '"+aId+"' AND User_Name = '"+userName+"'";
					rows2 = stmt2.executeQuery(query5);
					rows2.next();
					
					if(rows2.getFloat("Upper_Limit")!= 0 && rows2.getFloat("Increment_Price")!= 0 ) 
					{
						
//************************************** CHECK IF USER CAN BID AFTER CHEKING THE UPPER LIMIT **********************************

						if(rows2.getFloat("Upper_Limit")>= higestprice + rows2.getFloat("Increment_Price"))
						{
							ResultSet rows3;
							Random ran = new Random();
							int bidId;
							do
							{
								
							    bidId = ran.nextInt((99999 - 100) + 1) + 10;
								String checkBidNum = "SELECT Bid_Num FROM clone.buyer_bids WHERE Bid_Num = '"+bidId+"'";
								rows3 = stmt3.executeQuery(checkBidNum);
								
							}while(rows3.next());
							
							float bidAmount = higestprice + rows2.getFloat("Increment_Price");
							String currentDateTime = (LocalDate.now()).toString() + ";"+(LocalTime.now()).toString();

							String query6 = "INSERT INTO clone.buyer_bids (User_Name, Auction_Num, Bid_Num, Bid_Price, Date_Time, Upper_Limit, Increment_Price)VALUES('"+userName+"', '"+aId+"', '"+bidId+"', '"+bidAmount+"', '"+currentDateTime+"', '"+rows2.getFloat("Upper_Limit")+"', '"+rows2.getFloat("Increment_Price")+"')";
							stmt3.executeUpdate(query6);
							%> <p> 
									<h2>Alert!</h2>
										For auction <%= aId %>:<br> 
										Your auto bidding was generated.  
								</p>
							<% 							
						}
//************************************** IF USER DOES NOT PASS UPPER LIMIT TEST THEN ALIERT THAT THEIR AUTO BIDDING IS TERMIINATED    ********************************

						else if(rows2.getFloat("Upper_Limit")<= higestprice + rows2.getFloat("Increment_Price"))
						{
							ResultSet rows3;
							query4 = "SELECT p.Brand, p.Model, a.End_Date_Time, a.Increment_Amount, a.Auction_Num FROM clone.product p, clone.auctions a WHERE a.Auction_Num = '"+aId+"' AND p.Pid = '"+pId+"'";
							rows3 = stmt3.executeQuery(query4);
					
							while(rows2.next())
							{
						%>
							<p> 
							<h2>Alert!</h2>
							For auction <%= aId %>:<br> 
							<%=rows3.getString("Brand")%>, <%=rows3.getString("Model")%> : your auto bidding is terminated due to someone exceeding upper limit. 
							</p>
						<% 
							}
						}
						
					}
				
				}
//************************************************** THE MAIN UPPER LIMIT CHECK HAVE FINISHED  **********************************************************************
			}
//**********************************************************************************************************************************************************************************************************************************************************************************



//****************************************************************** CHECK IF THE AUCTION IS DONE ****************************************************************************************
		%> <br><br><br><br><h1> Alerts Related to Auction</h1> <br><%
			
			Statement smt1 = con.createStatement();
			Statement stm2 = con.createStatement();
			Statement stm3 = con.createStatement();
			Statement stm4 = con.createStatement();
			Statement stm5 = con.createStatement();
			Statement stm6 = con.createStatement();
			Statement stm7 = con.createStatement();
			

			ResultSet check1, check2, check3;
			String username = "", endDateTime = "", currentDate = "", winner = "", model = "", brand = "";
			int auction_Num, productId, bidNum = 0;
			float minimumAmount;
			float maxBidPrice = 0;

			
			String haveAuction = "SELECT Auction_Num, End_Date_Time, Minimum_Amount FROM clone.auctions WHERE Active = '1'";
			check1 = smt1.executeQuery(haveAuction);
			
		 	while( check1.next())
			{
				auction_Num = check1.getInt("Auction_Num");
				endDateTime = check1.getString("End_Date_Time");
				minimumAmount = check1.getFloat("Minimum_Amount");
				
				String dateTime = ((LocalDate.now()).toString() + " " + (LocalTime.now()).toString()).substring(0, 19);
				
				String checkEndDate = "SELECT * FROM clone.auctions WHERE  Auction_Num = '"+auction_Num+"' AND End_Date_Time < '"+dateTime+"'";
				ResultSet endDate = stm2.executeQuery(checkEndDate);
				
				System.out.println("I am HERE......");  //--------
				System.out.println("Auction Num: " + auction_Num);
				if(endDate.next())
				{
					String maxBidInfo = "SELECT User_Name, Bid_Price, Bid_Num FROM clone.buyer_bids WHERE Bid_Price = (SELECT MAX(Bid_Price) FROM clone.buyer_bids  WHERE Auction_Num = '"+auction_Num+"') AND Auction_Num = '"+auction_Num+"'";
					ResultSet maxInfo = stm3.executeQuery(maxBidInfo);
					
					if(maxInfo.next())
					{
						winner = maxInfo.getString("User_Name");
						maxBidPrice = maxInfo.getFloat("Bid_Price");
						bidNum = maxInfo.getInt("Bid_Num");
						
						if(maxBidPrice >= minimumAmount)
						{
							String updateWinner = "UPDATE clone.auctions SET Winner = '"+winner+"', Winning_Price = '"+maxBidPrice+"', Winning_Bid = '"+bidNum+"', Active = '0' WHERE Auction_Num = '"+auction_Num+"' ";
							stm4.executeUpdate(updateWinner);
							
						}
						else
						{
							String updateWinner = "UPDATE clone.auctions SET Active = '0' WHERE Auction_Num = '"+auction_Num+"' ";
							stm4.executeUpdate(updateWinner);
						}
						
						
					}
					
				}
					
			}
			
		 	
//*********************************************************** 	CHECK IF YOU WON ANY AUCTION ***********************************************************
			String checkifWinner = "SELECT Winner, Winning_Price, Auction_Num FROM clone.auctions WHERE Winner = '"+userName+"'";
			check2 = stm2.executeQuery(checkifWinner);
			
			if(check2.next())
			{
				int auctionId = check2.getInt("Auction_Num");
				float wonPrice = check2.getFloat("Winning_Price");
				
				String getProructID = "SELECT Pid FROM clone.product_for_auction WHERE Auction_Num = '"+auctionId+"'";
				check3 = stm3.executeQuery(getProructID);
				check3.next();
				
				int prodcutID = check3.getInt("Pid");
				
				String getProductInfo = "SELECT Brand, Model FROM clone.product WHERE Pid = '"+prodcutID+"'";
				check3 = stm3.executeQuery(getProductInfo);
				check3.next();
				
				%> <p> 
						<h2>Alert!</h2>
						Congratulations!!! You have won the auction:  <%= auctionId %>:<br> 
						<%= check3.getString("Brand")%>, <%=check3.getString("Model") %> : for $<%= wonPrice %> 
				   </p>
				<%
				
				
				
				
				
			}
		


























			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	%>

</body>
</html>