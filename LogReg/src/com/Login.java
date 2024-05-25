package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String a = request.getParameter("en");
		String b = request.getParameter("em");
		String c = request.getParameter("phno");
		String d = request.getParameter("department");
		String[] skill = request.getParameterValues("skills");
		String skillset = String.join(", ", skill);
		
		try {
			PrintWriter out = response.getWriter();
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeeDB","root","root");
			String qry = "insert into employees(employee_name,employee_email,employee_phone_number,employee_department) values(?,?,?,?)";
			String qry2 ="insert into skills(skills1) values(?)";
			PreparedStatement ps = con.prepareStatement(qry);
			PreparedStatement ps2 = con.prepareStatement(qry2);
			ps.setString(1, a);
			ps.setString(2, b);
			ps.setString(3, c);
			ps.setString(4, d);
			ps2.setString(1, skillset);
			int employee = ps.executeUpdate();
			int skills = ps2.executeUpdate();
			if (employee>0 && skills>0) {
				out.print("<html><body><script>alert('Added Successful')</script></body></html>");
				RequestDispatcher r = request.getRequestDispatcher("details.jsp");
				r.include(request,response);
			} else {
				out.print("<html><body><script>alert('Unsuccessful')</script></body></html>");
				RequestDispatcher r = request.getRequestDispatcher("login.html");
				r.include(request,response);
			}
			
			
		} catch (ClassNotFoundException E) {
			E.printStackTrace();
		} catch (SQLException E) {
			E.printStackTrace();
		}
		
		
	}

}
