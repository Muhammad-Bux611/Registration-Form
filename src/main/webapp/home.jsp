<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN SUCCESSFULLY</title>

</head>
<body>	
<%
if("POST".equalsIgnoreCase(request.getMethod())){
	String loginEmail=request.getParameter("username");
	String passwordEmail=request.getParameter("password");
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
    String url="jdbc:mysql://localhost:3306/registrationProject";
		
		String Systems_username="root";
		String SystemsPassword="software@muet19";
		Connection con=DriverManager.getConnection(url,Systems_username,SystemsPassword);
		String registerEmail="Select * from registerTable";

		Statement st=con.createStatement();
	    ResultSet rs=st.executeQuery(registerEmail);
	    
	    if(rs.next()){
	  do{ 
		  
		  if(loginEmail.equals(rs.getString("mail")) && passwordEmail.equals(rs.getString("pin")))
		{
			  out.print("<h2> login successfully</h2>");
			  out.print("<a href =login.jsp>LOGOUT</a>");
	  
	  }
		  
	  
	  }  while(rs.next());
	 
	    }else{
	    	response.sendRedirect("login.jsp");
	    }
	
		
	  String  sql="select * from admin";
	 ResultSet admin=st.executeQuery(sql);
	  while(admin.next()){
		  out.print("<div class= show>");
		  if(loginEmail.equals(admin.getString("email")) && passwordEmail.equals(admin.getString("pin"))){
			  

			  out.print("<h2> click the show user button to show the users</h2>");
			  out.print("<div class= links>");  
			  out.print("<a href =Showuser.jsp>Show User</a><br>");
			  out.print("<a href = login.jsp>Exit</a>");
			  out.print("</div>");

				break;
		  }
		  out.print("</div>");
	  }
	
	
	  
	}catch(ClassNotFoundException e){
		
	}
	 
}
	
	%>

</body>
</html>