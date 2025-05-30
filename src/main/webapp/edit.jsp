<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
		
		Connection con= DriverManager.getConnection(url,Systems_username,SystemsPassword);
		String email=request.getParameter("method");
		session.setAttribute("sessionMail",email);
		out.print("the email is :"+email);
		String query="select * from registerTable  where mail=?;";
		
		PreparedStatement st=con.prepareStatement(query);
		
		st.setString(1,email);
	 ResultSet  rs=st.executeQuery();
	
		String username="";
		String password="";
		String name="";
		if(rs.next()){
			out.print("this isthe if condition");
			username=rs.getString("mail");
			password=rs.getString("pin");
			name=rs.getString("name");
		
			out.print(username);
			session.setAttribute("name",name);
			session.setAttribute("mail",username);
			session.setAttribute("password", password);
		}else{
			out.print("the data is not present in this database");
		}
	}catch(Exception e){
		out.print(e.getMessage());
	}
%>

	<form action="update.jsp">
	<input type="text" name="name" value="<%= session.getAttribute("name")%>">
	<br>
	<br>
	<input type="email" name="mail" value="<%=session.getAttribute("mail")%>">
	<br>
	<br>
	<input type="text" name="pass" value="<%=session.getAttribute("password")%>">
	<br>
	<br>
	<input type="submit" value="update" >
	</form>
</body>
</html>