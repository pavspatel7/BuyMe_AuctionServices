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
		StringBuilder query = new StringBuilder("");
		String image  = request.getParameter("img");
		
		if(image == null)
		{
			image = "";
		}
		if(image.equals("Click here to view latest deals on Phones!!!"))
		{
			String a = "Phone";
			query.append("SELECT * FROM clone.product WHERE product_Type='"+a+"'");		}
		else if(image.equals("Click here to view latest deals on Laptops!!!"))
		{
			String a = "Laptop";
			query.append("SELECT * FROM clone.product WHERE product_Type='"+a+"'");
		}
		else if(image.equals("Click here to view latest deals on TV's!!!"))
		{
			String a = "TV";
			query.append("SELECT * FROM clone.product WHERE product_Type='"+a+"'");
		}
		else
		{
			String input = request.getParameter("Search");
			if(input.equals(""))
			{
				response.sendRedirect("Home.jsp");
			}
			input = input.toLowerCase().trim();
			String[] arrOfStr = input.split(" ", 10);
			int len = arrOfStr.length;

			query.append("SELECT * FROM clone.product WHERE");
			for(int i=0; i<len; i++)
			{
				query.append(" description LIKE '%" + arrOfStr[i] + "%'");
				if(i != (len-1))
					query.append(" AND");
			}
		}
				
		ResultSet rs = stmt.executeQuery(query.toString());
		while(rs.next())
		{
%>
			<tr>
				<th><%out.println(rs.getString("Product_Type")); %></th>
				<th><%out.println(rs.getString("Description")); %></th>
				<th><%out.println(rs.getInt("Price")); %></th>
				<th><%out.println(rs.getInt("Quantity")); %></th>
				<th>
					<form action="ViewAuction.jsp">
						<input type="submit" name="viewauction" value="View Auction?">
					</form>
				</th>
			</tr>
			
			
						
<%			
		}
		
		
		
		rs.close();
		stmt.close();
		con.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
%>
</body>
</html>