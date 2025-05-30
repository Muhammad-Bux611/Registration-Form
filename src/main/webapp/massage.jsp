<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InsERT THE DATA IN THE DATABASE</title>
</head>
<body>
	
	<%
	if("POST".equalsIgnoreCase(request.getMethod())){
		
	try{
		
		
		String firstname=request.getParameter("fsname");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String confirmPassword=request.getParameter("confirmpassword");
		
		if(password.equals(confirmPassword)){
			
			//String[] specialChar ={"!@#$%^&*()_+}{:;-="};

			//out.print(specialChar[2]);
			//for(int index=0;index<specialChar.length;index++){
				
			//if (password.contains(specialChar[index]) && password.length()>=8){
				if(password.length()>=8){
					if(password.contains("^")){
		out.print("<h1>your registration process is completed now can can easily login the data</h1>");
       Class.forName("com.mysql.cj.jdbc.Driver");
		
		String url="jdbc:mysql://localhost:3306/registrationProject";
		
		String Systems_username="root";
		String SystemsPassword="software@muet19";
		
		Connection con= DriverManager.getConnection(url,Systems_username,SystemsPassword);
		
		String insertData="insert into registerTable (name, mail, pin) values (?,?,?)";
		
		PreparedStatement pst=con.prepareStatement(insertData);
		pst.setString(1, firstname);
		pst.setString(2, email);
		pst.setString(3, password);
		
		
		int i=pst.executeUpdate();
	
		if(i>0){
			out.println("<h1>the data is inserted successfully</h1><br>");
			
			out.println("<h3>Do you want to register an other data then click the register button</h3><br>");
			out.print("<a href =register.jsp>Register</a><br>");

			out.println("<h3>Do you want to login  an other data then click the login button</h3>");
			out.print("<a href =login.jsp>LOGIN</a><br>");
			
		}else{
			out.println("the data is not inserted due to some reason");
		}
		pst.close();
		con.close();
			
		}
					else{
						out.print("your password must contain one special character ^");
						out.println("<br><a href=register.jsp>BACK</a>");

					}
		}
			
		
		else{
		out.print("your password length is less than 8 kindly enter the password which contain greater or equal to 8");
		out.println("<br><a href=register.jsp>BACK</a>");

		}
		
			
			}else{
				out.print("the password is not match kindly reegister again<br>");
				out.println("<a href=register.jsp>BACK</a>");
			}
	}
	
		catch(Exception e){
			e.getMessage();
		}
		
		}
	
	%>
</body>
</html>

