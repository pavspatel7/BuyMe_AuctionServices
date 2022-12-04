<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>By Me</title>
</head>
<body>
	<form action = "AuctionStoring" method = "Post">
	
	<label for = "Brand"> Brand </label>
	<input type = 'text' placeholder = 'Brand' id = "Brand" name = 'Brand' required> <br><br>
	
	<label for = "Model"> Model </label>
	<input type = 'text' placeholder = 'Model' id = "Model" name = 'Model' required><br><br>
	
	<label for = "Size"> Screen Size</label>
	<input type = 'text' placeholder = 'Size' id = "Size" name = 'Size' required><br><br>
	
	<label for = "Type"> Screen Type </label>
	<input type = 'text' placeholder = 'Type' id = "Type" name = 'type' required><br><br>
	
	<label for = "Resolution"> Resolution </label>
	<input type = 'text' placeholder = 'Resolution' id = "Resolution" name = "Resolution" required><br><br>
	
	<label for = "Condition"> Condition</label>
	<input type = 'text' placeholder = 'Condition' id = "Condition" name = "Condition" required><br><br>
	
	<label for = "Quantity"> Quantity</label>
	<input type = 'text' placeholder = 'Quantity' id = "Quantity" name = "Quantity" required><br><br>
	
	<label for = "Description"> Description </label>
	<textarea rows = "5" cols = "60" id = "Description" name = "description" required></textarea><br><br>
	
	<label for = "files"> Upload Product Images </label>
	<input type = 'file' name = 'files' id = "files "accept = 'image/jpg, image/png, image/gif' multiple required><br><br>
	
	<input type = 'Submit' value = 'Next' name = 'TV'>

	</form>

</body>
</html>