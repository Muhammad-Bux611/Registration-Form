package ahsan.com;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.*;

@WebServlet("/massage")
public class massage extends HttpServlet {
       
   	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		response.setContentType("text/html");

   		PrintWriter out= response.getWriter();
   		try{
   			Class.forName("com.mysql.cj.jdbc.Driver");
   			
   			String url="jdbc:mysql://localhost:3306/registrationProject";
   			
   			String Systems_username="root";
   			String SystemsPassword="software@muet19";
   			
   			String firstname=request.getParameter("fsname");
   			String email=request.getParameter("email");
   			String password=request.getParameter("password");
   			Connection con= DriverManager.getConnection(url,Systems_username,SystemsPassword);
   			
   			String insertData="insert into registerTable  values (?,?,?)";
   			
   			PreparedStatement pst=con.prepareStatement(insertData);
   			pst.setString(1, firstname);
   			pst.setString(2, email);
   			pst.setString(3, password);
   			
   			
   			int i=pst.executeUpdate();		
   			if(i>0){
   				out.println("the data is inserted successfully");
   			}else{
   				out.println("the data is not inserted due to some reason");
   			}
   			
   			pst.close();
   			con.close();
   			
   		}catch(Exception e){
   			e.getMessage();
   		}
   		
   		out.print("<a href=\"Showuser.jsp\">Show User</a>");
   		
   		
	
}
}