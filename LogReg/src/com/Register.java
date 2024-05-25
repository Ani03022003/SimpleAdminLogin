package com;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		//PrintWriter out1=response.getWriter();
		//out1.println("Hello");
		String a = request.getParameter("user");
		//String b = request.getParameter("em");
		String c = request.getParameter("pass");	
		
		try {
			PrintWriter out = response.getWriter();
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeeDB","root","root");
			//String qry = "insert into reg(name,email,pass) values(?,?,?)";
			String qry = "select * from admin where Name=(?) && password=(?)";
			PreparedStatement stmt = con.prepareStatement(qry);
			stmt.setString(1,a);
			//ps.setString(2,b);
			stmt.setString(2,c);
			java.sql.ResultSet rs=stmt.executeQuery();
			if (rs.next()) {
				out.print("<html><body><script>alert('Admin Successfully Logedin')</script></body></html>");
				RequestDispatcher r = request.getRequestDispatcher("details.jsp");
				r.include(request,response);
			} else {
				out.print("<html><body><script>alert('Admin Login Unsuccessful')</script></body></html>");
				RequestDispatcher r = request.getRequestDispatcher("index.html");
				r.include(request,response);
			}	
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
