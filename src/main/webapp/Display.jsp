<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import = "java.io.*, java.util.*, java.sql.*" %>
<%@ page import = "javax.servlet.http.*, javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<style>
	body {background-color: powderblue;}
	h1   {color: blue;}
	p    {color: red;}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

// Missing in Laptop: Color, Storage, Reslontion, Condition, display technology, ("price" if needed up to you)
// Missing in Phone: Screensize, Resolution, display technology, ("price" if needed up to you)
// Missing in TV: Color, change size to screensize, display technology, ("price" if needed up to you)

String input = request.getParameter("Search");
//out.print(input);
String[] str = input.split(" ", 10);

for(int i=0; i<str.length; i++)
{
	
}



%>






</body>
</html>