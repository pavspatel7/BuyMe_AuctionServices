<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import = "java.io.*, java.util.*, java.sql.*" %>
<%@ page import = "javax.servlet.http.*, javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<style>
	body {background-color: powderblue;}
	
	.table-style, th, td, tr
	{
		border: 1px solid black;
  		border-collapse: collapse;
  		padding: 20px;
  		margin-left: auto;
		margin-right: auto;
	}
	.createalert
	{
		text-align: center;
	}
	.sort
	{
		padding-left: 620px;
	}
	.sort1
	{
		padding-left: 720px;
	}
	
</style>
<meta charset="ISO-8859-1">
<title>BuyMe: Auction Services</title>
</head>
<body>

<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="Home.jsp">BuyMe: Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
            aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav me-auto mb-2 mb-md-0">
                <li class="nav-item">
                    <a class="nav-link" href="">ABC</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">DEF</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">XYZ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Logout.jsp">LogOut</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<br><br><br>

		<p class="sort"><span style="font-size: 25px">Sort your results based on one of the following?</span></p>
		<form action="DisplaySort.jsp">
		<p class="sort1">
			<input type="checkbox" id="sortprice" name="sortprice" value="price">
			<label for="sortprice"> Price</label><br>
			<input type="checkbox" id="sortproducttype" name="sortproducttype" value="producttype">
			<label for="sortproducttype"> Product Type</label><br>
			<input type="checkbox" id="available" name="available" value="available">
			<label for="available"> Availability</label><br>
			<input type="Submit" name="SortSubmit" value="Apply Filters?">
		</p>
		</form>

<table class="table-style">
			<tr>
				<th>
					<%out.print("Product Type"); %>
				</th>
				<th>
					<%out.print("Product Description"); %>
				</th>
				<th>
					<%out.print("Product Price"); %>
				</th>
				<th>
					<%out.print("Quantity"); %>
				</th>
				<th>
					<%out.print("Action"); %>				
				</th>
			</tr>
<%
	try
	{
		SqlConnection2 db = new SqlConnection2();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		HttpSession ses = request.getSession(false);
		String h = (String)ses.getAttribute("q1");
		if(h != null || !(h.equals("")))
		{
			StringBuilder h1 = new StringBuilder(h);
			String sortprice = request.getParameter("sortprice");
			String sortproducttype = request.getParameter("sortproducttype");
			String availability = request.getParameter("available");
			
			if(sortprice != null)
			{
				h1.append(" ORDER BY Price ASC");
			}
			else if(sortproducttype != null)
			{
				h1.append(" ORDER BY product_Type ASC");
			}
			else if(availability != null)
			{
				h1.append(" ORDER BY Quantity DESC");
			}
			ResultSet rows = stmt.executeQuery(h1.toString());
			while(rows.next())
			{
%>
				<tr>
				<th><%out.println(rows.getString("Product_Type")); %></th>
				<th><%out.println(rows.getString("Description")); %></th>
				<th><%out.println(rows.getInt("Price")); %></th>
				<th><%out.println(rows.getInt("Quantity")); %></th>
				<th>
					<form action="ViewAuction.jsp">
						<input type="submit" name="viewauction" value="View Auction?">
					</form>
				</th>
			</tr>
<%	
			}
		}
		stmt.close();
		con.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
%>
</table>
<br><br>
<div class="createalert">
	<p>Didn't find what you were looking for?<br>
	We can help you set up an alert and you will be notified when the product becomes available.</p>
	<form action="CreateAlert.jsp">
		<input type="submit" name="createalert" value="Create Alert?">
	</form>
</div>
</body>
</html>