<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>CookCode</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>
  	#foot {
  overflow: hidden;
  background-color: #333;
  position: fixed;
  bottom: 0;
  width: 100%;
  height: 50px;
}

		.lk {
  background-color: #f44336;
  width:80%;
  font-size:30px;
  color: white;
  margin-top:50px;
  margin-left:100px;
  padding: 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

a:hover, a:active {
  background-color: red;
 
}

body {
	background-image: url("https://cdn.pixabay.com/photo/2015/04/20/13/17/work-731198__340.jpg");
	 background-repeat: no-repeat;
	 background-size:cover;
}

  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">CookCode</a>
    </div>

    <ul class="nav navbar-nav navbar-right">
    <% if (session.getAttribute("uname") == null) {%>
      <li><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
     
     
      <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      <%}else { %>
      	<li><a href="user2.jsp?roll=${roll}"><span class="glyphicon glyphicon-user"></span> ${uname }</a></li>
      	<li><a href="Logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      <%} %>
      
    </ul>
  </div>
</nav>

	<div id = "dv">
	<% if (session.getAttribute("uname") != null) { %>
		<a href = "contestpage.jsp" class = "lk">click here for the contest page</a>
		
		<a href = "result2.jsp" class = "lk">Go to Ranklist</a>
		
		<%}; %>
	</div>
  
<!--  <div class="container">
  <h3>Right Aligned Navbar</h3>
  <p>The .navbar-right class is used to right-align navigation bar buttons.</p>
</div>-->
<footer id = "foot">hello</footer>
</body>
</html>
