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
		background-color:  #CBEBC3; 
		
	}
	
.buttonHolder{ text-align: center; }
input {
  border-top-style: hidden;
  border-right-style: hidden;
  border-left-style: hidden;
  border-bottom-style: groove;
  background-color: #eee;
  text-align: center;
}
</style>

<body>
 
	<h1 style = "font-family: monospace; text-align: center"> Your bid has been successfully placed. </h1><br>
	<h2 style = "font-family: monospace; text-align: center"> Would you Like to set up auto bidding? </h2><br>
	
	<div class = "buttonHolder">
		<form  action = "Bidding_Buying" method = "Post">
 			<h2 style = "font-family: monospace">Increment Price: </h2>
 			<input type = "text" Placeholder = "Increment Price" name = "Increment" style = "height:30px; width:300px; font-family: monospace; border-radius: 5px">
 			<h2 style = "font-family: monospace">Upper Limit: </h2>
 			<input type = "text" placeholder = "Upper Limit" name = "UpperLimit" style = "height:30px; width:300px; font-family: monospace; border-radius: 5px"><br><br>
 			<input type = "submit" Value = "Set" name = "AutoSet" style = "height:50px; width:100px; font-family: monospace; border-radius: 5px; background-color: #FFF3DB"><br><br>
 		</form>
 		
 		<form action = "Home.jsp" >
 			<input type = "submit" Value = "Return to home page" name = "homePage" style = "height:50px; width:250px; font-family: monospace; border-radius: 5px; background-color: #FFF3DB">
 		</form>		
	</div>
	


</body>
</html>