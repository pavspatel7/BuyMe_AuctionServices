<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">
	.d-none
	{
		display: none;
	}
</style>

</head>
<body>

<form action="Display.jsp" method="post">
<%
	String input = request.getParameter("Search");
	input = input.replaceAll("\\s", "").trim().toLowerCase();
	if((input).contains("phone"))
	{
%>
		<p>Enter the type of product that you are looking for:</p>
		<select name="producttype" id="producttype" onchange="enableBrand(this)">
			<option value="-1">Please Select</option>
			<option value="0" selected="selected">Phone</option>
			<option value="1">TV</option>
			<option value="2">Laptop</option>
		</select>
		
		<p id="phone">
			Please enter the brand that you are looking for: <input type="text" name="brand" placeholder="Brand"><br><br>
			Please enter the model that you are looking for: <input type="text" name="model" placeholder="Model"><br><br>
			Please enter the color that you are looking for: <input type="text" name="color" placeholder="Color"><br><br>
			How much phone storage would you like? <input type="text" name="storage" placeholder="storage"><br><br>
			What network carrier provider would you like: <br>(Enter Unlocked for Unlocked)? <input type="text" name="carrier" placeholder="Carrier"><br><br>
			What condition should your phone be in? <input type="text" name="condition" placeholder="Eg: Refurbished"><br><br>
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
		
		<p id="laptop">
			Please enter the brand that you are looking for: <input type="text" name="brand" placeholder="Brand"><br><br>
			Please enter the model that you are looking for: <input type="text" name="model" placeholder="Model"><br><br>
			Please enter the color that you are looking for: <input type="text" name="color" placeholder="Color"><br><br>
			What screen size are you looking for? <input type="text" name="screensize" placeholder="Eg:16inches"><br><br>
			What Processor are you looking for: <input type="text" name="processor" placeholder="Processor"><br><br>
			What RAM Size are you looking for: <input type="text" name="ram" placeholder="Eg:16GB"><br><br>
			What Operating System are you looking for? <input type="text" name="operatingsys" placeholder="Eg:Windows"><br><br>
			What condition should your phone be in? <input type="text" name="condition" placeholder="Eg: Refurbished"><br><br>
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
		
		<p id="tv">
			Please enter the brand that you are looking for: <input type="text" name="brand" placeholder="Brand"><br><br>
			Please enter the model that you are looking for: <input type="text" name="model" placeholder="Model"><br><br>
			Please enter the color that you are looking for: <input type="text" name="color" placeholder="Color"><br><br>
			What size TV are you looking for? <input type="text" name="size" placeholder="Eg:16inches"><br><br>
			What screen type are you looking for: <input type="text" name="type" placeholder="Eg:OLED"><br><br>
			What resolution are you looking for: <input type="text" name="resolution" placeholder="Eg:1000*1200"><br><br>
			What condition should your phone be in? <input type="text" name="condition" placeholder="Eg: Refurbished"><br><br>
			<input type = "submit" value = "Apply Filters" name = "TV"><br>
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
		<input type = "submit" value = "Apply Filters" name = "Laptop"><br>
	</p>

</form>

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