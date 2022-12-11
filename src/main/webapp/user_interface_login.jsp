<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8" import="Ebay_Clone.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*,java.time.*,java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style>
.image{
	width: 250px;
    height: 250px;
    align: center;
}
h1{
	font-size: 40px;
	text-align: center;
}
</style>

</head>
<body>
<img class="image" src="logo.jpg">

<center>
<h1>Hello</h1>
<h2>Sign in to BuyME or 
<a id="create-account-link" href="CreateNewUserFront.jsp">create an account</a>
</h2>
	<form action="LoginCheck.jsp" method="POST">
       Username: <input type="text" name="Username"/> <br/>
       Password: <input type="password" name="Password"/> <br/>
       Log-in as 
			<select name="Login_Type" size=1 required>
				<option value="admin">Admin</option>
				<option value="customer_representative">Customer Representative</option>
				<option value="user">user</option>
			</select>
			<input type="submit" value="Login">
     </form>
</center>

</body>
</html>
