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

	#fm {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

	.lk {
  background-color: #f44336;
  width:80%;
  margin:20px;
  font-size:30px;
  color: white;
  padding: 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}



a:hover, a:active {
  background-color: red;
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
  
	<div id = "fm">
		
				<a href = "ques1.jsp" class="lk">question 1</a>
			
				<a href ="#" class="lk">question 2</a>
				
				<a href ="#" class="lk">question 3</a>
			
				<a href ="#" class="lk">question 4</a>
		
	</div>
<footer id = "foot">hello</footer>
</body>
</html>
