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

@WebServlet("/Update")
public class Update extends HttpServlet {
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
			String tempqry = "select employee_id from employees where employee_email='"+b+"'";
			PreparedStatement stmt = con.prepareStatement(tempqry);
			ResultSet set=stmt.executeQuery();
			set.next();
			int num=set.getInt(1);
			String qry = "update employees set employee_name='"+a+"',employee_email='"+b+"',employee_phone_number='"+c+"',employee_department='"+d+"' where employee_id='"+num+"'";
			String qry2 = "update skills set skills1='"+skillset+"' where employee_id='"+num+"'";
			PreparedStatement ps = con.prepareStatement(qry);
			PreparedStatement ps2 = con.prepareStatement(qry2);
			int rs2 =ps2.executeUpdate();
			int rs = ps.executeUpdate();
			
			if (rs>0 && rs2>0) {
				out.print("<html><body><script>alert('Update Sucessful')</script></body></html>");
				RequestDispatcher r = request.getRequestDispatcher("details.jsp");
				r.include(request,response);
			} else {
				out.print("<html><body><script>alert('Update Unsucessful')</script></body></html>");
				RequestDispatcher r = request.getRequestDispatcher("update.jsp");
				r.include(request,response);
			}
			
		} catch (ClassNotFoundException E) {
			E.printStackTrace();
		} catch (SQLException E) {
			E.printStackTrace();
		}
		
	}

}
