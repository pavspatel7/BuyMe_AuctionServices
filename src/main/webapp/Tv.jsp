<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>By Me</title>
</head>
<body>
	<form action = "AuctionStoreing" method = "Post">
	
	<label for = "Brand"> Brand </label>
	<input type = 'text' placeholder = 'Brand' id = "Brand" name = 'Brand'> <br><br>
	
	<label for = "Model">  Model </label>
	<input type = 'text' placeholder = 'Model' id = "Model" name = 'Model'><br><br>
	
	<label for = "Size"> TV Size</label>
	<input type = 'text' placeholder = 'Size' id = "Size" name = 'Size' ><br><br>
	
	<label for = "Type"> TV Type </label>
	<input type = 'text' placeholder = 'Type' id = "Type" name = 'type'><br><br>
	
	<label for = "Condition"> Condition</label>
	<input type = 'text' placeholder = 'Condition' id = "Condition" name = 'Condition'><br><br>
	
	<label for = "Resolution"> Resolution </label>
	<input type = 'text' placeholder = 'Resolution' id = "Resolution" name = 'Resolution'><br><br>
	
	<label for = "Description"> Description </label>
	<textarea rows = "5" cols = "60" id = "Description" name = "description"></textarea><br><br>
	
	<label for = "files"> Upload Product Images </label>
	<input type = 'file' name = 'files' id = "files "accept = 'image/jpg, image/png, image/gif' multiple required><br><br>
	<input type = 'Submit' value = 'Next' name = 'Click'>

	</form>

</body>
</html>