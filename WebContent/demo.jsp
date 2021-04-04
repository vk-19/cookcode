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
  background-color: #222;
  position: fixed;
  bottom: 0;
  width: 100%;
  height: 25px;
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
    <form action = "Compile">
    <textarea name="code"></textarea>
<div id="code" style="margin-top:10px; width: 100%; height: 530px;">
   //Insert Code Here
</div>

<input class="btn btn-primary btn-block" type="submit" value="submit" style="margin-top: 600;">
</form>
  </div>
</nav>

	


    
 <div >
    <script src="ace-builds/src-noconflict/ace.js" type="text/javascript" charset="utf-8"></script>
    <script>
        var editor = ace.edit("code");
        var textarea = $('textarea[name="code"]').hide();
        editor.getSession().setValue(textarea.val());
        editor.getSession().on('change', function(){
          textarea.val(editor.getSession().getValue());
        });


        editor.setTheme("ace/theme/tomorrow");
        editor.session.setMode("ace/mode/c_cpp");
        editor.resize();
        document.getElementById('code').style.fontSize='20px';
    </script>
 </div>
<footer id = "foot"></footer>
</body>
</html>
