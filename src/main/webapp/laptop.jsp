<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>By Me</title>
</head>
<body>

	<form action = 'AuctionStoring' method = 'post'>
	
	<label for = "Brand"> Brand </label>
	<input type = 'text' placeholder = 'Brand' id = "Brand" name = 'Brand' required> <br><br>
	
	<label for = "Model"> Model </label>
	<input type = 'text' placeholder = 'Model' id = "Model" name = 'Model' required> <br><br>	
	
	<label for = "Screensize"> ScreenSize </label>
	<input type = 'text' placeholder = 'Screensize' id = "Screensize" name = 'Screeensize' required><br><br>
	
	<label for = "Processor"> Processor </label>
	<input type = 'text' placeholder = 'Processor' id = "Processor" name = 'Processor' required><br><br>
	
	<label for = "Ram"> RAM </label>
	<input type = 'text' placeholder = 'RAM' id = "Ram" name = 'Ram'><br><br>
	
	<label for = "Operating_sys"> Operating System </label>
	<input type = 'text' placeholder = 'Operating System' id = "Operating_sys" name = 'OperatingSystem' required><br><br>
	
	<label for = "Quantity"> Quantity</label>
	<input type = 'text' placeholder = 'Quantity' id = "Quantity" name = 'Quantity' required><br><br>
	
	<label for = "Description"> Description </label>
	<textarea rows = "5" cols = "60" id = "Description" name = "description" required></textarea><br><br>
	
	<label for = "files">Upload Product Images </label>
	<input type = "file" name = "files" id = "files" accept = "image/png, image/gif, image/jpeg"multiple required><br><br>
	
	<input type = 'Submit' value = 'next' name = 'click'><br><br>
	</form>
	
</body>
</html>