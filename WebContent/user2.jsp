<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.vineet.UserDao"%>
<%@ page import="java.sql.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
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

.customDiv {
    margin:3px;
    text-align: center;
    max-height: 500px;
    background-color: silver;
    font-size:20px;
    overflow-y: scroll;
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

	<sql:setDataSource
		var = "myDS"
		driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/cookcode"
        user="admin" password="password"
	/>
	
	 <sql:query var="file"   dataSource="${myDS}">
        SELECT * FROM file where roll=${param.roll};
    </sql:query>
    
    <sql:query var="nm"   dataSource="${myDS}">
        SELECT name FROM user where roll=${param.roll};
    </sql:query>

	<div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="c">
                    
                        
                        Name 
                        <c:forEach var="row" items="${nm.rows}">
                        	<c:out value="${row.name}"/>
                        </c:forEach>
                        <br>
                        Roll ${param.roll}
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="c">
                        Your submissions
                    </div>
                </div>


                <div class="col-md-12">
                    <div class="customDiv">
                        <table class="table table-striped table-bordered">
                            <thead>
                              <tr>
                                <td>ques</td>
                                <td>verdict</td>
                                <td>lang</td>
                                <td>view</td>
                              </tr>
                            </thead>

                            <tbody>
                                <c:forEach var="row" items="${file.rows}">
                                   <tr>
                    					<td><c:out value="${row.ques}" /></td>
                    					<td><c:out value="${row.verdict}" /></td>
                    					<td>c++</td>
                    					<td><a href="ques.jsp?path=${row.name}" class="btn btn-primary">view</a></td>
                					</tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>



</body>
</html>
