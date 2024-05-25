<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
PrintWriter t = response.getWriter();
String a = request.getParameter("em");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeeDB","root","root");
String qry = "delete from employees where employee_id='"+a+"'";
String qry2 = "delete from skills where employee_id='"+a+"'";
PreparedStatement ps = con.prepareStatement(qry);
PreparedStatement ps2 = con.prepareStatement(qry2);
int rs2 = ps2.executeUpdate();
int rs = ps.executeUpdate();

if(rs>0 && rs2>0){
	t.print("<html><body><script>alert('Delete Sucessful')</script></body></html>");
	RequestDispatcher r = request.getRequestDispatcher("details.jsp");
	r.include(request,response);
}else{
	t.print("<html><body><script>alert('Delete Unsucessful')</script></body></html>");
	RequestDispatcher r = request.getRequestDispatcher("details.jsp");
	r.include(request,response);
}
%>
</body>
</html>