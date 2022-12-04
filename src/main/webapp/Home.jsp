<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="CACHE-CONTROL" content="NO-CACHE" />
<title>BuyMe: Auction Services</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<link rel="stylesheet" href="/css/site.css">
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Monoton&display=swap');
	
		main>.container {
		    padding: 60px 15px 0;
		}
		
		main>.container-fluid {
		    padding-top: 60px;
		}
		
		body> main {
		    margin-top: 20px;
		    margin-bottom: 40px;
		}
		
		.homeBG {
		    width: 100%;
		    background: url(/img/GridBG.png);
		    background-repeat: no-repeat;
		    background-position: center;
		    background-size: cover;
		    background-attachment: fixed;
		}
		
		.homeText {
		    font-family: 'Monoton', cursive;
		    color: yellow;
		}
		
		.minHeight {
		    min-height: 80vh;	    
	}
	</style>
</head>
<body class="d-flex flex-column h-100">

<%
		HttpSession sess = request.getSession(false);
		String name = (String)sess.getAttribute("Users");
	
		response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0"); 
		
		if(session.getAttribute("Users")==null)
		{
		    response.sendRedirect(request.getContextPath() + "/logout.jsp");
		}
	%>

<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="Home.jsp">BuyMe: Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
            aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav me-auto mb-2 mb-md-0">
                <li class="nav-item">
                    <a class="nav-link" href="">XYZ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp">Log Out</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

    <main class="flex-shrink-0">
    <div class="container-fluid h-100 minHeight">
        <div class="row h-100 row-cols-1 row-cols-md-2 gy-2">
            <div class="col col-md-12">
                <div class="container text-center text-light h-100">
                
                
                    <form action = "Display.jsp" class="search-bar">
						<Input Type = 'text' Placeholder = 'Search: Laptop,TV,Phone..' Name = 'Search'>
						<Input Type = 'Submit' Value = 'Search' Name = 'Click'>
					</form>
					
					
                </div>
            </div>
            <div class="col col-md-4 order-last">
                <div class="bg-dark text-light h-100">
                    
                    
                    <img src="img/laptopimg.jpg" height="500" width="500" alt="Laptop">
                    
                    
                </div>
            </div>
            <div class="col col-md-4">
                <div class="bg-secondary text-white h-100">
                    COL THREE
                </div>
            </div>
            <div class="col col-md-4">
                <div class="bg-secondary text-white h-100">
                    COL THREE
                </div>
            </div>
        </div>
   </div>
</main>
    
    <footer class="footer mt-auto py-3 bg-dark sticky-footer">
        <div class="container-fluid text-center">
            <span class="text-white">BuyMe: Auction Services By Pavitra Patel, Aditi Patel, Romil Patel, & Smit Patel</span>
        </div>
    </footer>
</body>
</html>