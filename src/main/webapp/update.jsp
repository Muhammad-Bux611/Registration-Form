<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
		
	
	try{

        Class.forName("com.mysql.cj.jdbc.Driver");
		
		String url="jdbc:mysql://localhost:3306/registrationProject";
		
		String Systems_username="root";
		String SystemsPassword="software@muet19";
		String email=request.getParameter("mail");
		String pin =request.getParameter("pass");
		String name=request.getParameter("name");
		
		String sessionMail=(String)session.getAttribute("sessionMail");
		out.print(sessionMail);
		String sql="update registerTable set name=?,mail=?,pin=? where mail=?";
		
		Connection con= DriverManager.getConnection(url,Systems_username,SystemsPassword);
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, name);
		st.setString(2, email);
		st.setString(3, pin);
		st.setString(4, sessionMail);
		
		int i=st.executeUpdate();
		if(i>0){
			out.print("the data is update successfully");
			
		}
		else{
			out.print("failed");
		}
		
		
	}catch(Exception e){
		out.print(e.getMessage());
	}
	%>
</body>
</html>