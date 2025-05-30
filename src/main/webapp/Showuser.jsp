<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Data from Database</title>
<style type="text/css">
.getdata {
    height: 300px;
    width: 500px;
    background-color: lime;
    border: 2px solid red;
    padding-left: 40px;
    padding-top: 50px;
    font-size: 20px;
    margin: auto;
    margin-bottom: 10px;
}
span {
    color: blue;
}
.btn {
    display: flex;
    justify-content: space-around;
    margin-top: 30px;
}
.btn a {
    text-decoration: none;
    color: white;
    padding: 5px 10px;
    border-radius: 5px;
}
.btn a#ed {
    background-color: blue;
}
.btn a#del {
    background-color: red;
}
</style>
</head>
<body>
<%
try {
    // Load MySQL Driver
    Class.forName("com.mysql.cj.jdbc.Driver");

    // Database Connection
    String url = "jdbc:mysql://localhost:3306/registrationProject";
    String dbUser = "root";
    String dbPassword = "software@muet19";

    Connection con = DriverManager.getConnection(url, dbUser, dbPassword);
    Statement st = con.createStatement();
    String query = "SELECT * FROM registerTable";

    ResultSet rs = st.executeQuery(query);

    while (rs.next()) {
        out.print("<div class='getdata'>");
        
        // Fetch Data
        String name = rs.getString("name");
        String email = rs.getString("mail"); // Ensure column name is correct
        String pin = rs.getString("pin");

        // Hide Password
        String hidePassword = "*".repeat(pin.length());

        // Store in Session (Optional)
         session.setAttribute("name", name);
        session.setAttribute("email", email);
        session.setAttribute("pin", hidePassword); // Don't store raw password

        // Display Data
        out.println("<span>Name:</span> " + name + "<br>");
        out.println("<span>Email Address:</span> " + email + "<br>");
        out.println("<span>Password:</span> " + hidePassword + "<br>");
		%>
       <div class="btn">
       <a id="del"  href="delete.jsp?id=<%=email%>">Delete</a>
       
       <a id="ed" href="edit.jsp?method=<%=email%>">Edit</a>
       </div>
        <% 
        // Edit & Delete Buttons
        //out.print("<div class='btn'>");
        //out.print("<a  href='edit.jsp'>Edit</a>");
        //out.print("<a href='delete.jsp'>Delete</a>");
        //out.print("</div>");

        out.print("</div>");
    }
    
    rs.close();
    st.close();
    con.close();
} catch (Exception e) {
    e.printStackTrace();
    out.println("<h3 style='color:red;'>Database Connection Error: " + e.getMessage() + "</h3>");
}
%>
</body>
</html>
