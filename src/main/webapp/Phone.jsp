<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>By Me</title>
</head>
<body>
	<form action = "AuctionStoreing" method = "Post" enctype = "multipart/form-data">
	
	<label for = "Brand" >Brand</label>
	<input type = "text" placeholder = "Brand" id = "Brand" name = "Brand"> <br><br>
	
	<label for  = "Model">Model</label>
	<input type = "text" placeholder = "Model" id = "Model" name = "Model"> <br><br>
	
	<label for = "Carrier"> Carrier </label>
	<input type = "text" placeholder = "Carrier" id = "Carrier"name = "Carrier"> <br><br>
	
	<label for = "Capacity">Capacity</label>
	<input type = "text" placeholder = "Capacity" id = "Capacity" name = "Capacity"><br><br>
	
	<label for = "Color"> Color </label>
	<input type = "text" placeholder = "Color" id = "Color" name = "Color"><br><br>
	
	<label for = "Condition"> Condition</label>
	<input type = "text" placeholder = "Condition" id = "Condition" name = "Condition"><br><br>
	
	<label for = "Description"> Description </label>
	<textarea rows = "5" cols = "60" name = "description" id = "Description"></textarea><br><br>
	
	<label for = "Images">Upload Product Images</label>
	<input type = "file" name = "files" id = "images" accept="image/png, image/gif, image/jpeg" multiple required><br><br>
	
	
	<input type = "submit" value = "Next" name = "Phone">
	</form>
</body>
</html>