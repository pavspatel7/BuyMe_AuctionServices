<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
	body
	{
		background-color:  #FAD6A5; 
		
	}
</style>
<body>
<form action = "StoreAuction" method = "Post">
	
		<h2 style = "font-family: monospace"> Enter information about your auction.</h2>
		
		<h3 style = "font-family: monospace">Price: </h3>
		<input type = "number" placeholder = "Price" name = "Price" style = "height:30px; width:300px; font-family: monospace; border-radius: 5px">
		
		<h3 style = "font-family: monospace" >Increment amount: </h3>
		<input type = "number" placeholder = "Increment Amount" name = "IncrementAmount" style = "height:30px; width:300px; font-family: monospace; border-radius: 5px">
		
		<h3 style = "font-family: monospace" >Minimum amount: </h3>
		<input type = "number" placeholder = "Minimum Amount" name = "MinimumAmount" style = "height:30px; width:300px; font-family: monospace; border-radius: 5px">
		
		<h3 style = "font-family: monospace" >Shipping type: </h3>
		<input type = "text" placeholder = "eg. UPS, FedEx" name = "Shipping" style = "height:30px; width:300px; font-family: monospace; border-radius: 5px">
		
		<h3 style = "font-family: monospace" >End date: </h3>
		<input type = "Date" placeholder = "Date" name = "Date" style = "height:40px; width:100px; font-family: monospace; border-radius: 5px">
		
		<h3 style = "font-family: monospace" >End Time: </h3>
		<input type = "Time" placeholder = "Time" name = "Time" style = "height:40px; width:100px; font-family: monospace; border-radius: 5px">
		
		<input type = "submit" Value = "Done" name = "Done" style = "height:35px; width:100px; font-family: monospace; border-radius: 5px">
		

	</form>
</body>
</html>