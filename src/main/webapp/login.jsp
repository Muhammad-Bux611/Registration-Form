<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN PAGE</title> 
<link rel="stylesheet" href="login.css">
</head>
<body> 
<div class="loginPage">
	<form action="home.jsp " method="post">
	<img alt="image" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5gv6VVdtAGLqBK9MXIBOUGJ-hWeVdiiN-3Q&s">
	<div class='email'>
	<span>Enter emailAdrress*:</span>
	<br>
	<input type="email" name="username" required>
	</div>
 	<div class='password'>
 	<span>Enter password*:</span>
 	<br>
	<input type="password" name="password" required>
	</div>
	<div class='btns'>
	<input type="submit" value="Login">
	<br>
	<input type="reset" value="RESET">
	<br>
	<a href="register.jsp" >REGISTER</a>
	</div>
	</form>
	</div>

</body>
</html>