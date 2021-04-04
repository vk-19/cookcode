<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import= "java.util.Scanner" %>
<%@ page import= "java.io.File" %>
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
	
	.customDiv {
	padding-top:40px;
    margin:50px;
    text-align: center;
    min-height: 200px;
    background-color: silver;
    font-size:60px;
    /*overflow-y: scroll;*/
}

.c {
    margin:3px;
    text-align: center;
    
    background-color: silver;
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
       <li><a href="user2.jsp?roll=${roll}"><span class="glyphicon glyphicon-user"></span> ${uname}</a></li>
      <li><a href="Logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    </ul>
  </div>
</nav>
	<div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="customDiv">
<% 
	out.println(request.getParameter("verdict"));
%>

	
                    </div>
                </div>
              
            </div>
            
           <c:if test="${param.error_file != null}">
           		<div class="row">
           			<div class="col-md-12">
<pre class="pre-scrollable">
	<%
		File f = new File(request.getParameter("error_file"));
		Scanner sc = new Scanner(f);
		
		while (sc.hasNextLine()) {
			out.println(sc.nextLine());
		}
	%>
</pre>	
           			</div>
           		</div>
           </c:if>
        </div>
<footer id = "foot">hello</footer>
</body>
</html>
