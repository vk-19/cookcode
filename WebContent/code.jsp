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

textarea {
	overflow-y:scroll;
	font-size:20px;
	margin-left:350px;
	background-color:yellow;
}

#sub {
	margin-left:650px;
	font-size:20px;
	margin-top:20px;
	background-color:red;
}

	.ques {
		font-size: 20px;
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
      <li><a href="user2.jsp?roll=${roll}"><span class="glyphicon glyphicon-user"></span> ${uname}</a></li>
      <li><a href="Logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    </ul>
  </div>
</nav>
	<h1 style="text-align:center;">Insert Code Here</h1>
	<form action="Compile" method="get">
		
		<br>
		<textarea rows="10" cols="50" name = "code"></textarea>
		<br>
		<input id="sub" type = "submit" value="submit"/>
	</form>
  	
  	
<footer id = "foot">hello</footer>
</body>
</html>
