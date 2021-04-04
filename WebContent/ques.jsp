<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.vineet.UserDao"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Scanner" %>
<%@ page import= "java.io.*" %>
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

	<div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="customDiv">
<pre class="pre-scrollable">
<%
	String path = request.getParameter("path");
	File f = new File(path);
	Scanner sc = new Scanner(f);
	while (sc.hasNextLine()) {
		out.println(sc.nextLine());
	}
%>
</pre>
                    </div>
                </div>
            </div>
        </div>
<footer id = "foot">hello</footer>
</body>
</html>
