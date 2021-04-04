<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

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

	.login {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  font-size:20px;
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

#fm {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

#head1 {
	text-align:center;
	font-size:50px;
}
  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="home.jsp">CookCode</a>
    </div>
   
    <ul class="nav navbar-nav navbar-right">
      <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> login</a></li>
     
    </ul>
  </div>
</nav>

	<script>var check = function() {
	  if (document.getElementById('pass').value ==
		    document.getElementById('lname').value) {
		    document.getElementById('message').style.color = 'green';
		    document.getElementById('message').innerHTML = 'Passwords Match!';
		    document.getElementById('submit').disabled = false;
		  } else {
		    document.getElementById('message').style.color = 'red';
		    document.getElementById('message').innerHTML = 'Passwords dont Match!';
		    document.getElementById('submit').disabled = true;
		  }
		}</script>

	<h1 id ="head1">Register</h1>
	<div id ="fm">
  <form action="Register" method="get">
    <label for="fname">Enter your Roll Number</label>
    <input type="text" class="login" id="fname" required name="roll" placeholder="Your Roll no..">
    
    <label for="fname">Enter username</label>
    <input type="text" class="login" id="fname" required name="name" placeholder="Your Name..">

    <label for="lname">create password</label>
    <input type="password" class = "login" id="pass" required name="pass1" onkeyup='check();' placeholder="Your password..">
    
    <label for="lname">confirm password</label>
    <input type="password" class="login" id="lname" required name="pass2" onkeyup='check();' placeholder="Your password..">
	<span id ="message"></span>
  
  
    <input type="submit" id="submit" value="Enter">
    

    
  </form>
  
   	<c:if test="${registered}">
   	<c:remove var="registered" scope="session"/>
  		<script>
  			alert("Registered Succesfully!! Click OK to continue to Homepage.");
  			window.location='home.jsp';
  		</script>
  		
  		
  		
  	</c:if>
  
  	<c:if test="${rollexist}">
  		<script>
  			alert("Roll Number already exists, try again.");
  		</script>
  		<c:remove var="rollexist" scope="session"/>
  	</c:if>
</div>
  

<footer id = "foot">hello</footer>
</body>
</html>
