<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action = "SqlProcut" method = "Post">
	Brand: <input type = 'text' placeholder = 'Brand' name = 'Brand'> <br><br>
	Model: <input type = 'text' placeholder = 'Model' name = 'Model'><br><br>
	TV Size: <input type = 'text' placeholder = 'Size' name = 'Size' ><br><br>
	TV Type: <input type = 'text' placeholder = 'Type' name = 'type'><br><br>
	Condition: <input type = 'text' placeholder = 'Condition' name = 'Condition'><br><br>
	Resolution: <input type = 'text' placeholder = 'Resolution' name = 'Resolution'><br><br>
	Description: 
	<textarea rows = "5" cols = "60" name = "description"></textarea><br>
	<input type = 'Submit' value = 'Next' name = 'Click'>

	</form>

</body>
</html>