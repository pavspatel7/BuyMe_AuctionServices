<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BuyMe: Auction Services</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

<style type="text/css">
	
	body {background-color: powderblue;}
	.d-none
	{
		display: none;
	}
	
</style>

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

<br><br><br><br>
<main class="flex-shrink-0">
	<div class="container minHeight h-100">
		<div class="row-12 gy-2 h-100">
			<div class="col">
				<div class="bg-secondary text-light h-100 p-2">
<form action="Display.jsp" method="post">
<%
	String input = request.getParameter("Search");
	input = input.replaceAll("\\s", "").trim().toLowerCase();
	if((input).contains("phone"))
	{
%>
		<h4>Enter the type of product that you are looking for:</h4>
		<select name="producttype" id="producttype" onchange="enableBrand(this)">
			<option value="-1">Please Select</option>
			<option value="0" selected="selected">Phone</option>
			<option value="1">TV</option>
			<option value="2">Laptop</option>
		</select>
		<br><br>
		
		<p id="phone">
			Please enter the brand that you are looking for: <input type="text" name="brand" placeholder="Eg: Apple"><br><br>
			Please enter the model that you are looking for: <input type="text" name="model" placeholder="Eg: iPhone 11"><br><br>
			Please enter the color that you are looking for: <input type="text" name="color" placeholder="Eg: White"><br><br>
			How much phone storage would you like? <input type="text" name="storage" placeholder="Eg: 256GB"><br><br>
			What network carrier provider would you like: <br>(Enter Unlocked for Unlocked)? <input type="text" name="carrier" placeholder="Ex: TMobile"><br><br>
			What condition should your phone be in? <input type="text" name="condition" placeholder="Eg: Used"><br><br>
		
			<span style="font-size: 25px">Sort your results based on:</span>
			<br>
			<input type="checkbox" id="sortprice" name="sortprice" value="sortprice">
			<label for="sortprice"> Price</label><br>
			<input type="checkbox" id="sortproducttype" name="sortproducttype" value="sortproducttype">
			<label for="sortproducttype"> Product Type</label><br>
			<input type="checkbox" id="availability" name="availability" value="availability">
			<label for="availability"> Availability</label><br><br>
			
			<input type = "submit" value = "Apply Filters" name = "Phone"><br>
		</p>
<%
	}
	else if((input).contains("laptop") || (input).contains("mac"))
	{
%>
		<p>Enter the type of product that you are looking for:</p>
		<select name="producttype" id="producttype" onchange="enableBrand(this)">
			<option value="-1">Please Select</option>
			<option value="0">Phone</option>
			<option value="1">TV</option>
			<option selected="selected" value="2">Laptop</option>
		</select>
		<br><br>
		
		<p id="laptop">
			Please enter the brand that you are looking for: <input type="text" name="brand" placeholder="Brand"><br><br>
			Please enter the model that you are looking for: <input type="text" name="model" placeholder="Model"><br><br>
			Please enter the color that you are looking for: <input type="text" name="color" placeholder="Color"><br><br>
			What screen size are you looking for? <input type="text" name="screensize" placeholder="Eg:16inches"><br><br>
			What Processor are you looking for: <input type="text" name="processor" placeholder="Processor"><br><br>
			What RAM Size are you looking for: <input type="text" name="ram" placeholder="Eg:16GB"><br><br>
			What Operating System are you looking for? <input type="text" name="operatingsys" placeholder="Eg:Windows"><br><br>
			What condition should your phone be in? <input type="text" name="condition" placeholder="Eg: Refurbished"><br><br>
		
			<span style="font-size: 25px">Sort your results based on:</span>
			<br>
			<input type="checkbox" id="sortprice" name="sortprice" value="price">
			<label for="sortprice"> Price</label><br>
			<input type="checkbox" id="sortproducttype" name="sortproducttype" value="producttype">
			<label for="sortproducttype"> Product Type</label><br>
			<input type="checkbox" id="available" name="available" value="available">
			<label for="available"> Availability</label><br><br>
			
			<input type = "submit" value = "Apply Filters" name = "Laptop"><br>
		</p>
<%
	}
	else if((input).contains("tv") || (input).contains("television"))
	{
%>
		<p>Enter the type of product that you are looking for:</p>
		<select name="producttype" id="producttype" onchange="enableBrand(this)">
			<option value="-1">Please Select</option>
			<option value="0">Phone</option>
			<option selected="selected" value="1">TV</option>
			<option value="2">Laptop</option>
		</select>
		<br><br>
		
		<p id="tv">
			Please enter the brand that you are looking for: <input type="text" name="brand" placeholder="Brand"><br><br>
			Please enter the model that you are looking for: <input type="text" name="model" placeholder="Model"><br><br>
			Please enter the color that you are looking for: <input type="text" name="color" placeholder="Color"><br><br>
			What size TV are you looking for? <input type="text" name="size" placeholder="Eg:16inches"><br><br>
			What screen type are you looking for: <input type="text" name="type" placeholder="Eg:OLED"><br><br>
			What resolution are you looking for: <input type="text" name="resolution" placeholder="Eg:1000*1200"><br><br>
			What condition should your phone be in? <input type="text" name="condition" placeholder="Eg: Refurbished"><br><br>
		
			<span style="font-size: 25px">Sort your results based on:</span>
			<br>
			<input type="checkbox" id="sortprice" name="sortprice" value="price">
			<label for="sortprice"> Price</label><br>
			<input type="checkbox" id="sortproducttype" name="sortproducttype" value="producttype">
			<label for="sortproducttype"> Product Type</label><br>
			<input type="checkbox" id="available" name="available" value="available">
			<label for="available"> Availability</label><br><br>
			
			<input type = "submit" value = "Apply Filters" name = "Laptop"><br>
		</p>
<%		
	}
	else
	{
		response.sendRedirect("Display.jsp");
	}
%>
	<p id="phone" class="d-none">
		
		Please enter the brand that you are looking for: <input type="text" name="brand" placeholder="Brand"><br><br>
		Please enter the model that you are looking for: <input type="text" name="model" placeholder="Model"><br><br>
		Please enter the color that you are looking for: <input type="text" name="color" placeholder="Color"><br><br>
		How much phone storage would you like? <input type="text" name="storage" placeholder="storage"><br><br>
		What network carrier provider would you like: <br>(Enter Unlocked for Unlocked)? <input type="text" name="carrier" placeholder="Carrier"><br><br>
		What condition should your phone be in? <input type="text" name="condition" placeholder="Eg: Refurbished"><br><br>
		
		<span style="font-size: 25px">Sort your results based on:</span>
		<br>
		<input type="checkbox" id="sortprice" name="sortprice" value="price">
		<label for="sortprice"> Price</label><br>
		<input type="checkbox" id="sortproducttype" name="sortproducttype" value="producttype">
		<label for="sortproducttype"> Product Type</label><br>
		<input type="checkbox" id="available" name="available" value="available">
		<label for="available"> Availability</label><br><br>
		
		<input type = "submit" value = "Apply Filters" name = "Phone"><br>
	</p>
	
	<p id="tv" class="d-none">
		Please enter the brand that you are looking for: <input type="text" name="brand" placeholder="Brand"><br><br>
		Please enter the model that you are looking for: <input type="text" name="model" placeholder="Model"><br><br>
		Please enter the color that you are looking for: <input type="text" name="color" placeholder="Color"><br><br>
		What size TV are you looking for? <input type="text" name="size" placeholder="Eg:16inches"><br><br>
		What screen type are you looking for: <input type="text" name="type" placeholder="Eg:OLED"><br><br>
		What resolution are you looking for: <input type="text" name="resolution" placeholder="Eg:1000*1200"><br><br>
		What condition should your phone be in? <input type="text" name="condition" placeholder="Eg: Refurbished"><br><br>

		<span style="font-size: 25px">Sort your results based on:</span>
		<br>
		<input type="checkbox" id="sortprice" name="sortprice" value="price">
		<label for="sortprice"> Price</label><br>
		<input type="checkbox" id="sortproducttype" name="sortproducttype" value="producttype">
		<label for="sortproducttype"> Product Type</label><br>
		<input type="checkbox" id="available" name="available" value="available">
		<label for="available"> Availability</label><br><br>

		<input type = "submit" value = "Apply Filters" name = "TV"><br>
	</p>
	
	<p id="laptop" class="d-none">
		Please enter the brand that you are looking for: <input type="text" name="brand" placeholder="Brand"><br><br>
		Please enter the model that you are looking for: <input type="text" name="model" placeholder="Model"><br><br>
		Please enter the color that you are looking for: <input type="text" name="color" placeholder="Color"><br><br>
		What screen size are you looking for? <input type="text" name="screensize" placeholder="Eg:16inches"><br><br>
		What Processor are you looking for: <input type="text" name="processor" placeholder="Processor"><br><br>
		What RAM Size are you looking for: <input type="text" name="ram" placeholder="Eg:16GB"><br><br>
		What Operating System are you looking for? <input type="text" name="operatingsys" placeholder="Eg:Windows"><br><br>
		What condition should your phone be in? <input type="text" name="condition" placeholder="Eg: Refurbished"><br><br>
		
		<span style="font-size: 25px">Sort your results based on:</span>
		<br>
		<input type="checkbox" id="sortprice" name="sortprice" value="price">
		<label for="sortprice"> Price</label><br>
		<input type="checkbox" id="sortproducttype" name="sortproducttype" value="producttype">
		<label for="sortproducttype"> Product Type</label><br>
		<input type="checkbox" id="available" name="available" value="available">
		<label for="available"> Availability</label><br><br>
		
		<input type = "submit" value = "Apply Filters" name = "Laptop"><br>
	</p>

</form>
				</div>
			</div>
		</div>
	</div>
</main>

<script type="text/javascript">
		function enableBrand(answer)
		{
			if(answer.value == -1)
			{
				document.getElementById('phone').classList.add('d-none');
				document.getElementById('tv').classList.add('d-none');
				document.getElementById('laptop').classList.add('d-none');
			}
			
			if(answer.value == 0)
			{
				document.getElementById('phone').classList.remove('d-none');
			}
			else
			{
				document.getElementById('phone').classList.add('d-none');
			}
			
			if(answer.value == 1)
			{
				document.getElementById('tv').classList.remove('d-none');
			}
			else
			{
				document.getElementById('tv').classList.add('d-none');
			}
			
			if(answer.value == 2)
			{
				document.getElementById('laptop').classList.remove('d-none');
			}
			else
			{
				document.getElementById('laptop').classList.add('d-none');
			}
		}
	</script>

</body>
</html>