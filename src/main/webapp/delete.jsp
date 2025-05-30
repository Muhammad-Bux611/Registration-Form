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
	String email=request.getParameter("id");

	String query="delete from registerTable where mail=?;";

	PreparedStatement st=con.prepareStatement(query);
	st.setString(1,email);
	
	int i=st.executeUpdate();
	if(i>0){
		out.print("the data is deleted successuflly");
	}else{
		out.print("the data is not deleted from your data base");
	}
}catch(Exception e){
	
}
	
%>

</body>
</html>
can this code perform delete operation ... 