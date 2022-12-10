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
			</tr>
<%
	try
	{
		SqlConnection2 db = new SqlConnection2();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String input = request.getParameter("producttype");
		
		String sortprice = request.getParameter("sortprice");
		String sortproducttype = request.getParameter("sortproducttype");
		String availability = request.getParameter("availability");
		
		if(input == null)
		{
			String img = request.getParameter("img");
			if(img == null)
			{
				input = "6";
			}
			else if(img.equals("Click here to view latest deals on Phones!!!"))
			{
				input = "3";
			}
			else if(img.equals("Click here to view latest deals on TV's!!!"))
			{
				input = "4";
			}
			else if(img.equals("Click here to view latest deals on Laptops!!!"))
			{
				input = "5";
			}
		}
		
		StringBuilder query = new StringBuilder();
		
		if(input.equals("0"))
		{
			input = "Phone";
			String brand = request.getParameter("brand");
			String model = request.getParameter("model");
			String color = request.getParameter("color");
			String storage = request.getParameter("storage");
			String carrier = request.getParameter("carrier");
			String condition = request.getParameter("condition");
			query.append("SELECT * FROM clone.product WHERE Product_Type='"+input+"'");
			if(brand != "")
			{
				query.append(" and Brand='"+brand+"'");
			}
			if(model != "")
			{
				query.append(" and Model='"+model+"'");
			}
			if(color != "")
			{
				query.append(" and Color='"+color+"'");
			}
			if(storage != "")
			{
				query.append(" and Storage_Cap='"+storage+"'");
			}
			if(carrier != "")
			{
				query.append(" and Carrier='"+carrier+"'");
			}
			if(condition != "")
			{
				query.append(" and Conditions='"+condition+"'");
			}
		}
		else if(input.equals("1"))
		{
			input = "TV";
			String brand = request.getParameter("brand");
			String model = request.getParameter("model");
			String color = request.getParameter("color");
			String size = request.getParameter("size");
			String type = request.getParameter("type");
			String resolution = request.getParameter("resolution");
			String condition = request.getParameter("condition");
			query.append("SELECT * FROM clone.product WHERE Product_Type='"+input+"'");
			if(brand != "")
			{
				query.append(" and Brand='"+brand+"'");
			}
			if(model != "")
			{
				query.append(" and Model='"+model+"'");
			}
			if(color != "")
			{
				query.append(" and Color='"+color+"'");
			}
			if(size != "")
			{
				query.append(" and Screen_Size='"+size+"'");
			}
			if(type != "")
			{
				query.append(" and Screen_Type='"+type+"'");
			}
			if(resolution != "")
			{
				query.append(" and Resolution='"+resolution+"'");
			}
			if(condition != "")
			{
				query.append(" and Conditions='"+condition+"'");
			}
		
		}
		else if(input.equals("2"))
		{
			input = "Laptop";
			String brand = request.getParameter("brand");
			String model = request.getParameter("model");
			String color = request.getParameter("color");
			String screensize = request.getParameter("screensize");
			String processor = request.getParameter("processor");
			String ram = request.getParameter("ram");
			String operatingsys = request.getParameter("operatingsys");
			String condition = request.getParameter("condition");
			query.append("SELECT * FROM clone.product WHERE Product_Type='"+input+"'");
			if(brand != "")
			{
				query.append(" and Brand='"+brand+"'");
			}
			if(model != "")
			{
				query.append(" and Model='"+model+"'");
			}
			if(color != "")
			{
				query.append(" and Color='"+color+"'");
			}
			if(screensize != "")
			{
				query.append(" and Screen_Size='"+screensize+"'");
			}
			if(processor != "")
			{
				query.append(" and Processor='"+processor+"'");
			}
			if(ram != "")
			{
				query.append(" and RAM='"+ram+"'");
			}
			if(operatingsys != "")
			{
				query.append(" and Operating_Sys='"+operatingsys+"'");
			}
			if(condition != "")
			{
				query.append(" and Conditions='"+condition+"'");
			}
		
		}
		else if(input.equals("3"))
		{
			input = "Phone";
			query.append("SELECT * FROM clone.product WHERE Product_Type='"+input+"'");
		}
		else if(input.equals("4"))
		{
			input = "TV";
			query.append("SELECT * FROM clone.product WHERE Product_Type='"+input+"'");
		}
		else if(input.equals("5"))
		{
			input = "Laptop";
			query.append("SELECT * FROM clone.product WHERE Product_Type='"+input+"'");
		}
		else
		{
			query.append("SELECT * FROM clone.product");
		}
		
		if(sortprice != null && sortproducttype != null && availability != null)
		{
			query.append("ORDER BY Price ASC, Product_Type ASC, Quantity DESC");
		}
		if(sortprice != null && sortproducttype != null)
		{
			query.append("ORDER BY Price, Product_Type");
		}
		if(sortproducttype != null && availability != null)
		{
			query.append("ORDER BY Product_Type ASC, Quantity DESC");
		}
		if(sortprice != null && availability != null)
		{
			query.append("ORDER BY Price ASC, Quantity DESC");
		}
		
		if(sortprice != null)
		{
			query.append("ORDER BY Price");
		}
		if(sortproducttype != null)
		{
			query.append("ORDER BY Product_Type");
		}
		if(availability != null)
		{
			query.append("ORDER BY Quantity DESC");
		}
		
		ResultSet rs = stmt.executeQuery(query.toString());
		while(rs.next())
		{
%>			<tr>
				<th><%out.println(rs.getString("Product_Type")); %></th>
				<th><%out.println(rs.getString("Description")); %></th>
				<th><%out.println(rs.getInt("Price")); %></th>
				<th><%out.println(rs.getInt("Quantity")); %></th>
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
</table>
</body>
</html>