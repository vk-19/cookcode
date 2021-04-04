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
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                <h1 style="text-align: center; font-weight: 100;">Add Two Numbers</h1>
                <pre style="background-color: white; font-size: 20px; border: transparent;">
Write a program to add two numbers
                </pre>
               </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                 <h4>Constraints</h4>
                 <pre>
1 <= A <= B <= 1000
                 </pre>
                </div>
             </div>

             <div class="row">
                <div class="col-md-12">
                 <h4>Input</h4>
                 <pre>
1 2
3 4
5 6
                 </pre>
                </div>
             </div>

             <div class="row">
                <div class="col-md-12">
                 <h4>Output</h4>
                 <pre>
 3
 7 
 11                 
                 </pre>
                </div>
             </div>

             <div class="row">
                 <div class="col-md-6 offset-md-6">
                     <form action="demo.jsp">
                         <input class="btn btn-primary" type="submit" value="submit">
                     </form>
                 </div>
             </div>
        </div> 

<%
	session.setAttribute("ques", "1");
%>
	

  	</div>
  
<!--  <footer id = "foot">hello</footer>-->
</body>
</html>
