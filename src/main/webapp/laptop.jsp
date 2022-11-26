<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form action = 'SqlProduct' method = 'post'>
	Brand: <input type = 'text' placeholder = 'Brand' name = 'Brand'> <br><br>
	Model: <input type = 'text' placeholder = 'Model' name = 'Model'> <br><br>	
	Screen Size: <input type = 'text' placeholder = 'Screensize' name = 'Screeensize' ><br><br>
	Processor: <input type = 'text' placeholder = 'Processor' name = 'Processor'><br><br>
	RAM: <input type = 'text' placeholder = 'RAM' name = 'Ram'><br><br>
	Operating System: <input type = 'text' placeholder = 'Operating System' name = 'OperatingSystem'><br><br>
	Type: <input type = 'text' placeholder = 'Notebook/Laptop' name = 'type'><br><br>
	Description: 
	<textarea rows = "5" cols = "60" name = "description"></textarea><br>
	<input type = 'Submit' value = 'next' name = 'click'>
	</form>
	
</body>
</html>