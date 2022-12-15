<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="Ebay_Clone.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Frequently Asked Questions</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css">
</head>
<body>
	<button onclick="window.location.href='postQuestion.jsp';">Go back to ask a question page</button>

<h3> View all Questions</h3>
	<%
	PreparedStatement ps = null;
	ResultSet result = null;
	ApplicationDB db = new ApplicationDB();	
	Connection connect = db.getConnection();	

	try {
		String username = (session.getAttribute("user")).toString();
		String questionsQuery = "SELECT * FROM question_answers";
		String check = "Customer rep hasn't answered yet";
		ps = connect.prepareStatement(questionsQuery);
		result = ps.executeQuery();
		out.print("<table>");
		out.print("<tr>");
		out.print("<th>");
		out.print("Question ID");
		out.print("</th>");
		out.print("<th>");
		out.print("Question");
		out.print("</th>");
		out.print("<th>");
		out.print("Answer");
		out.print("</th>");
		out.print("<th>");
	//	out.print("Answered By Customer Rep Name");
	//	out.print("</th>");
		while (result.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print(result.getInt("questionId"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("question"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("answer"));
			out.print("</td>");
		out.print("<td>");
	//	out.print(result.getString("customerRepName"));
	//	out.print("</td>");
		out.print("</tr>");
			
		}
		out.print("</table>");
	} catch (SQLException e) {
		out.print("<p>Error</p>");
		e.printStackTrace();
	} finally {
		try {
			result.close();
		} catch (Exception e) {
		}
		try {
			connect.close();
		} catch (Exception e) {
		}
	}
	%>

</body>
</html>
