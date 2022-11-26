<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action = "SqlProduct" method = "post">
	Brand: <input type = "text" placeholder = "Brand" name = "Brand"> <br><br>
	Model: <input type = "text" placeholder = "Model" name = "Model"> <br><br>
	Carrier: <input type = "text" placeholder = "Carrier" name = "Carrier"> <br><br>
	Capacity: <input type = "text" placeholder = "Capacity" name = "Capacity"><br><br>
	Color: <input type = "text" placeholder = "Color" name = "Color"><br><br>
	Condition: <input type = "text" placeholder = "Color" name = "Condition"><br><br>
	Description: 
	<textarea rows = "5" cols = "60" name = "description"></textarea><br>
	<input type = "submit" value = "Next" name = "Click">
	</form>
	
</body>
</html>