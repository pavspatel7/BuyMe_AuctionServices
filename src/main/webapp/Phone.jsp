<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>By Me</title>
</head>
<body>
	<form action = "AuctionStoring" method = "Post" enctype = "multipart/form-data">
	
	<label for = "Brand" >Brand</label>
	<input type = "text" placeholder = "Brand" id = "Brand" name = "Brand" required> <br><br>
	
	<label for  = "Model">Model</label>
	<input type = "text" placeholder = "Model" id = "Model" name = "Model" required> <br><br>
	
	<label for = "Color"> Color </label>
	<input type = "text" placeholder = "Color" id = "Color" name = "Color" required><br><br>
	
	<label for = "Storage">Storage</label>
	<input type = "text" placeholder = "Storage" id = "Storage" name = "Storage" required><br><br>
	
	<label for = "Carrier"> Carrier </label>
	<input type = "text" placeholder = "Carrier" id = "Carrier"name = "Carrier" required> <br><br>
	
	<label for = "Condition"> Condition</label>
	<input type = "text" placeholder = "Condition" id = "Condition" name = "Condition" required><br><br>
	
	<label for = "Quantity"> Quantity</label>
	<input type = 'text' placeholder = 'Quantity' id = "Quantity" name = 'Quantity' required><br><br>
	
	<label for = "Description"> Description </label>
	<textarea rows = "5" cols = "60" name = "description" id = "Description" required></textarea><br><br>
	
	<label for = "Images">Upload Product Images</label>
	<input type = "file" name = "files" id = "images" accept="image/png, image/gif, image/jpeg" multiple required><br><br>
	
	
	<input type = "submit" value = "Next" name = "Phone">
	</form>
</body>
</html>