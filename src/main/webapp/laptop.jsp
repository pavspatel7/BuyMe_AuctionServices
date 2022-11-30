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
	<input type = 'text' placeholder = 'Brand' id = "Brand" name = 'Brand'> <br><br>
	
	<label for = "Model"> Model </label>
	<input type = 'text' placeholder = 'Model' id = "Model" name = 'Model'> <br><br>	
	
	<label for = "Screensize"> ScreenSize </label>
	<input type = 'text' placeholder = 'Screensize' id = "Screensize" name = 'Screeensize' ><br><br>
	
	<label for = "Processor"> Processor </label>
	<input type = 'text' placeholder = 'Processor' id = "Processor" name = 'Processor'><br><br>
	
	<label for = "Ram"> RAM </label>
	<input type = 'text' placeholder = 'RAM' id = "Ram" name = 'Ram'><br><br>
	
	<label for = "Operating_sys"> Operating System </label>
	<input type = 'text' placeholder = 'Operating System' id = "Operating_sys" name = 'OperatingSystem'><br><br>
	
	<label for = "Type"> Type </label>
	<input type = 'text' placeholder = 'Notebook/Laptop' id = "Type" name = 'type'><br><br>
	
	<label for = "Description"> Description </label>
	<textarea rows = "5" cols = "60" id = "Description" name = "description"></textarea><br><br>
	
	<label for = "files">Upload Product Images </label>
	<input type = "file" name = "files" id = "files" accept = "image/png, image/gif, image/jpeg"multiple required><br><br>
	
	<input type = 'Submit' value = 'next' name = 'click'><br><br>
	</form>
	
</body>
</html>