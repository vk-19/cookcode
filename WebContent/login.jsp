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

	#fname, #lname {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
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
      <li><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
     
    </ul>
  </div>
</nav>

	<h1 id ="head1">Log In</h1>
	<div id ="fm">
  <form action="Login">
    <label for="fname">Roll Number</label>
    <input type="text" id="fname" name="roll"required placeholder="Your roll no..">

    <label for="lname">password</label>
    <input type="password" id="lname" name="pass" required placeholder="Your password..">
    <span id="message"></span>
	<c:if test="${usernotfound}">
	<c:remove var="usernotfound" scope="session"/>
	<script>
	document.getElementById("message").innerHTML="Invalid Username/Password";
	document.getElementById("message").style.color="red";
	</script>
	</c:if>
  
  
    <input type="submit" value="Enter">
  </form>
</div>
  

<footer id = "foot">hello</footer>
</body>
</html>
