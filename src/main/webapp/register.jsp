<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REGISTRATION</title>
<link rel="stylesheet" href="register.css">
</head>
<body>
<div class="register">
	<form action="massage.jsp" method="post">
	<div class="image">
	<img alt="" src="https://media.gettyimages.com/id/1354173923/vector/register-stamp-imprint-seal-template-grunge-effect-vector-stock-illustration.jpg?s=612x612&w=gi&k=20&c=3xRWqxUSvlm4lLU-ke3lRwuIQUxLvb-M5-3qBpXSjUU=">
	</div>
	<div class="data">
	<span>
	Enter firstName:*
	</span>
	<input type="text" name="fsname" required>
	<br>
	
	<span>Enter your email:*</span>
	<input type="email" name="email" required>
	<br>
	<span>
	Enter password:</span>
	<input type="password" name="password" required>
	<br>
	<span>
	Enter confirm password:</span>
	<input type="password" name="confirmpassword" id="cfn" required>
	
	<input type="submit" value="Register">
	</div>
	</form>
	</div>
</body>
</html>